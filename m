Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C541606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUMbsuaW;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lyyzifHP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zrjNaK2BMmlXskrm0KIplH9eRZPk+1mRx+s4P8jKOWE=; b=hUMbsuaWVMESHn
	p6lemvvJ4BhhezhQ7NsXy6a7OkQuqTNv7i1WoSI9kMF7xl9F4CIsyF7QTeIBZWHFNf7eTIZDXhVD/
	YmpZsp9js3JXymAK3VduNwrsnHLzZQwR0ywOD4W/e5WMrD88uuB0dMRS5bLAkeBBwr15k5P5rYmcD
	22B2qg1TmhRoErF1rmnEn8A6z7zh4zl1NL6CX5JA6y5H41eOdow/FMF1H4aDZBDqWPOFnGTAWvB8S
	/NMlDNc12hSbxvI1s/i7AhU7Umm3itBbsh6m7wEe1UxMknAO7+m215JCry69np2HNZx5Y0Es4fzaA
	eMWBKFFApM/wdoLD6x2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJM1-00000005xh6-15Aj;
	Tue, 17 Nov 2026 13:36:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJLz-00000005xgO-04ab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:36:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 60DE71A1114;
	Tue, 17 Nov 2026 13:36:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25CAD5FC81;
	Tue, 17 Nov 2026 13:36:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9E8811BC0008;
	Tue, 17 Nov 2026 14:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zrjNaK2BMmlXskrm0KIplH9eRZPk+1mRx+s4P8jKOWE=;
	b=lyyzifHPUW/TF25iVGcxxozdbgkY/qmW1+lpBdGXZzGqQBZBIxE9ZXOrdLz16IlpxWvZAk
	e3266PE7euLObTyJBNNOD797XSiUMy+84nhboxxypsKcu5qqeCH+AMH8pXUbz7yQIOFi4m
	SaWzef4Ie2MByykrYRur3B+bdJc6V5dqFAfpqMamQs7QDl4nqcqBC+BSxjqGrt5p/Ofweb
	bXxizpY1Ry07WMp2HJIXA8/jPSrSjJC/q2QZ72HJvH3QYlAcD0LHnTLH+PFyxi9O5KdQFf
	My8aknE77tEPjHyXg5TFzJ3Vqdwj5lkD7lGsu+sQypAq3Y72ZkyBr6VTHnsgag==
Message-ID: <613e303b-635c-4751-8988-2687f8f39c4b@bootlin.com>
Date: Tue, 17 Nov 2026 14:35:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: drop the rest of the frame when
 napi_build_skb() fails
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, stable@vger.kernel.org
References: <20261113-stmmac-rx-skb-fail-v1-1-fcaae89f2d2c@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261113-stmmac-rx-skb-fail-v1-1-fcaae89f2d2c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053607_212896_38DF2D3D 
X-CRM114-Status: GOOD (  11.10  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/13/26 18:13, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> If napi_build_skb() fails on the first buffer of a frame that spans
> several descriptors, stmmac_rx() drops that buffer but goes on with the
> next descriptor of the same frame as if a new frame started there. The
> rest of the frame is then passed up the stack as a frame of its own. A
> frame spans several descriptors when it does not fit in the RX buffers
> of one descriptor.
> 
> Mark the frame as errored instead, so that its remaining descriptors are
> discarded like those of a frame with a receive error. The frame is
> counted once in rx_dropped and once against the NAPI budget.
> 
> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

As you say, this only makes sense until Lorenzo's work makes it, this
should be suitable for net.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


