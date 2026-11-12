Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=21zYrlHi;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ZrNPvQFC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yEC/vZNOKTkAFWLkMBKlCC1dHTq3fXauXlYSOK1PQyw=; b=21zYrlHi7KWEOP
	YR2bOnKcvyMSC8N+TpxZi85orBJOlLiHJWbUtMP3BtwzaS1JlWLfZ8Lrt13/4lfvcy5Cb/YI0E6Yj
	kEAw9nE8FocIf8jdZWfXJpohzFmtKGfMlRUK1DiQSlRqFswVSinqJm72V3XFJwyVNbuO8xl0/vEWu
	gpCcg95LojT/5qYP8/U3gb/vSDRnJMyBvNXb0ZzP0jc5Ac3kuIhJfhAJTb+AMQVzQyKLsPyCx5Dxu
	r/qTz+luzCI2XwX9iA8jWvQBWKrhY41zPTZb0E5nwpX2S0y/o3Q/h7qY4GUHQ+rajCNkuC98NXY1+
	e+h1qIX3N1IysxHY2Otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRXC-00000009R8I-0dyz;
	Thu, 12 Nov 2026 09:55:58 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRX8-00000009R7t-0cBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:55:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC880A166C;
	Thu, 12 Nov 2026 10:55:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794477351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yEC/vZNOKTkAFWLkMBKlCC1dHTq3fXauXlYSOK1PQyw=;
	b=ZrNPvQFCjsKZS7uA10pKE5Ip5QJMXl7RtmjRFs5ZpJwi4sQNluDjt2qSC7fH+oUYwvcC9t
	cqo3Ws0M/ab44x9I7FmHdrzIG6HsXHXWY6nQwOd/kKqZvLWO+yMCabcflpxOXgz0gP3NPu
	7QdvnVxkgVAbBVUUAxBh5GDCi0+AbkI7alCvyXUKLmOMccEyvtGbf2y1m8H/9oER8+3X3q
	gkTUN+1qv0cnZvoWOtZtBqx0m/i9Mkb46zs9vmFOuL6nC/VdOgY9vR8TxKEaeIWqyZysyU
	Wfqwdt14wRUuwQlAjbdeOWgJ693cGtodKUTQlnB6YJeTO3GbMH5DpZMVcQSO9g==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 10:55:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: re-base EST after PTP settime64
In-Reply-To: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
References: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
Message-ID: <6fcb41af4802e0d5b9d759b5e2d3ecd6@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_015554_647974_0E91A3D3 
X-CRM114-Status: UNSURE (   5.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo

On 11.11.2026 10:54, Lorenzo Bianconi wrote:
> stmmac_set_time() initializes the PTP clock through
> stmmac_init_systime() (TSINIT) while holding only ptp_lock.  It neither
> takes est_lock nor disables and re-bases EST around the step, unlike
> stmmac_adjust_time(), which performs TSUPDT through
> stmmac_adjust_systime() under est_lock.

adjust_time() drops est_lock around the step, so this isn't quite right.
Same for "as stmmac_adjust_time() does" below. Please reword this if 
there
is a v2.

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

