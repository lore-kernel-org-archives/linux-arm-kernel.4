Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jwsr2W9G;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SA9ROFUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qd7T0XQeMuB4TEUS/4gTtVnEGv53KlVhW/3K24NUHPs=; b=jwsr2W9GI7qhnY
	VJBA3DsKNCitqsKndyzrx4JMUWRHfAyMvjCckNz55N+hwgWH2vc3ZtvUtKss3GCZ7nXWX+Rp44wNT
	eZ+0ltxW29Rf437YK+qP2y6XumdxQC1NYQLUfD9bsV0Z51xNcu7Qoav5B9Lxq035NXsC5bheBY8ig
	hnrLvrZx/C4/Ev/3OaCDg1OnCZ+ysqwehiIxwGZ9M4jM4IVP+qpYu5ocIzMQTh9HdKexLRNnKovIX
	6AwLalsa7sOcQowuFihO7kVNE60ATIqr15D9hJ1+JSwuHV6FJgXXPLQzt6TlsRE/lHOlYRexGiguu
	iz7bbguMqeh7eRaoh/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbE1-000000003hQ-2sk5;
	Sun, 15 Nov 2026 14:28:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbDy-000000003g3-1ekV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:28:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95C8D60D16;
	Sun, 15 Nov 2026 14:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3681F000C4;
	Sun, 15 Nov 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752933;
	bh=qd7T0XQeMuB4TEUS/4gTtVnEGv53KlVhW/3K24NUHPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SA9ROFUhfxPEAFREHKzDoyWDaBYsQ4kUcYlJx2NGd/sMgXCMtfpojGTHsNC4i999z
	 d4I3L4lryfiZXUzgec6OxBQRTBrBlHbt93uC6i1TCNWKE1SMUMP3Fwg41U+pOp5F3k
	 a32CduoNmbTSFmOj/4j7NJwLGemJHpQ6YtXDz2z6ACh3qMuMFVKpj2Ex9IHRZNxzMO
	 Er3r7f0kqD96nXQHn5jTUBCLbsoaLNl5quiB4uRtMMsTEvqMRziX4fpc5hcOxlInj1
	 vM6zAPWz5G36jNtUz9TS6pvggryMDlpwy9XQndt7Hm/U2BB2xsUQu0Mq/fYzTkemhJ
	 hz4jb7Z2cVbUQ==
Message-ID: <b485a0cc-91ed-44bc-80bb-fb61d10feccb@kernel.org>
Date: Sun, 15 Nov 2026 16:28:48 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] clk: at91: Add peripheral clock id for OTPC
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Mihai Sain <mihai.sain@microchip.com>,
 Durai Manickam KR <durai.manickamkr@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-7-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-7-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 13:06, Alexander Dahl wrote:
> Add the peripheral clock IDs for OTPC.
> This clock is required for proper OTPC operation.

Next time, please wrap it at 75 chars according to the submitting patches 
requirements [1].

[1] https://docs.kernel.org/process/submitting-patches.html

> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

