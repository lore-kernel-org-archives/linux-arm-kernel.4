Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D99606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 03:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MLgFvLV9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOkz6pax
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=; b=MLgFvLV9dpHpXxBTq/qzYd0sZ9
	+Wx+UdMOtr5eo6BcCycISfpsKAV0FdmxnjP1WowRv+qzv2hIhYcKS6SyJMjOGwkPEJXjHrr0aVhBU
	3zpI6SpZxfd2F1OvoXnsVQH6ve/MOl/mi8VSUEzca6HS8ozHZOcI4t4OS2J80Bpf7IP/b5Z0F9yCD
	WCkLeTyozmkxOF6MWxsKvgGr0OuJlzfkTP2i0SymnyxuVB6wI2rOSXXsEKZ0N60rVaM9mRgSEUiOC
	wQbAPMySlFCTw4935F76uxjthW01hbamR1Pk/TgLMruyBxO2eLWUltWQAr0jq5SXw7P88Bs8FqfUi
	pjz0jXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDU-00000007c9i-2Ckx;
	Wed, 18 Nov 2026 03:20:12 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDR-00000007c9J-3jVl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 03:20:11 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so657801fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972007; cv=none;
        d=google.com; s=arc-20260327;
        b=Q+CusArQJy7N9kX4LyDwtiNRAKNzV+nqPdiYwIK+dkhfbu/AkxIfXrf+qmyVZphbYs
         USGkJOKCitIpsimvCJOdoBotzrkypho4pEJhM6KqHAuI53qqy5s34LPBSylPArGkKqwg
         TWEyXwdntzuFN5qUgVROp8Dfnu8nhbu96TY4cuG9vP4ocdXel9lAISA/fFgvQhOV8sLu
         sTx/UwziqrXSr2cUneEsx4xwL/fmjm1XYWDQPWwnc9TAa8x59Ti8JAsFBd+c5WFw4cFy
         ZB39WgP+Pgn7+bOPf10hTHeXwbGvNTzUdIsNiQGzHnxQEqttKasUwczMdtU/xrm5TiHe
         /xqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        fh=AfbR0uCseqt4VS/AUXppo+rbUfbo8gl+37SQjmtR2D8=;
        b=LvhJ1ac8RngPmSBPKmc1ZykyLrf7ooUEc+qKG1t5Rz1Arvme3ZlIinfCTFM9Flg/sx
         LuRCLTboVUg5cVM8KTWAkADPwCU7oG6Kb0WUXzaKS/pSv0LAVK9bs8cHlMMuTi68ne0i
         U/a4iH/AEi5tGH4zJxv4DLBFmfl7M+F/S/MP9f1aRer0SC1XrXxNrSQeLvn7zOIua9AZ
         pteRKBZJP8ziJ3iPP/VYO6faax/loVv6pXBsEM+7j+62Ipup+t9Hwedu6xxtTKj1cwu5
         PIiilgbFSfrSaRqHut+ecAFOCQMKRVsbYETorCVXK6ogjoNnsQhyjr6xlCbAlFE/aU+f
         xFHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794972007; x=1795576807; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=mOkz6paxnpZFV9CsjRrp40AHR2s9YyGwSAWT/n5Cw3KBygJfOB35XAjrMlo8jdCYej
         mx7411E11aog9G9cDNMSqpGAlk4fjK3QbH3oj0WCVd3KAHFOmW6UPGmyYIiQS5QIKQK8
         THu7CJdu4xrCKyUcoN0iGMtNGKe1oS5BMwYaptfMf1WmN6bzBtjtHX5pEw7LAoJ/Po7I
         cGeGJJ50RyRrdRQi1h0/FN4Y63gALIx7N5H0OHNsV57xo9KcONVSPnvtoZLe/q4/3FRC
         3vLLdsyoQf50+L41P8JiDIIBDpetmk+CWPQGLYudepxlGRREAoI351doipzx+QHBDTT1
         BYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972007; x=1795576807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=1IL5VxuIcohBcxoCJCxqZn2uoYRrYO878sPMT32uoSaF7UmVNQLzBGCGfAnloodjz3
         Py2PhyMeVXK6X5QmwumNPEzzw+/XpWLQHLMjF/4JM8UE2h+xbkJM4af0pv1mXJDESkJN
         VS7qABoZThmLPOGLYDuXeYjZ97dCdoI6dWEx4d+HTncTlqdHfc9G3vL+uPgFwc7OeqaT
         n5U4pDcF4wzFRKPn87FbeGfgUPAMv4ySjeikTGfo2K2aKVEkogmXvhNfQTE0PKm+6hXh
         MGHSH834nx7Y3wrGrhbkHlVYTCEU4Dgvoet0Drn6Vj3SkQxSv11twX8yEgiR80L6N73W
         rirg==
X-Forwarded-Encrypted: i=1; AL+hErGJrNi4nXhMx3ot49UtO85Y03TRUW0vRk27JMknQ4rLriE8KTzloLwqHv+8u/hIzn+eM9//Dt4s8Tf159w+lYW8@lists.infradead.org
X-Gm-Message-State: APuU4Z/kqps0xGSI4H51+4voHGzN77TfGiikhriP5heGkul0ESTzFRsd
	sppQBPCtwq57XOlYsl6DCRdOSq8Dqkmb50yzM5k3A5OD3XnCT5l4AS2IzGmKmBiqLBLUKfANc7K
	9By35wos0u+MtyhvlzgC6Ldx4ER+ZEV4=
X-Gm-Gg: AYBFou2rbR1OC1RD2tkSURIx9mtkrWn0WaJTBnCh2fgewpDgIXjLN8as3Cs1L689DVI
	fDrWdT7oI19nWf0LC6Icm5zRS5uwdqxH0tUNJN9s1JF9HBKXMR0xEMB8iLID+cYWwa175px3LmF
	uCf3lbjNEbPz+c1uI38uc2ycTpRRrnYfrNzoDQ9gvKooaxqvUZRhCpCC474Ctk6mgEhr4v1ghna
	Tncnuwi1m06ZLlxfCOXmEL/d5n4YgOsxHIh9IKWPEk4EZLRUHlspaCHsiLuyDJUjt9cXD5vdx3X
	69arwdaIZliGxMiNzZpVJusCB8xv5r0FDUTA2/eS5LTK9qZ/vbucjV4p3BZxJHyMbiii1mkEF/J
	Y9O8fCZ28hJ3PxrhNpwyB7Xubg/1aScdVmdhc9snl++B2MfTTnY91WQJ1TlV1EerdpW7kl8L46b
	5TVG8GG+Gh4s2AUuAR
X-Received: by 2002:a05:6512:1326:b0:5c1:4e17:1ed6 with SMTP id
 2adb3069b0e04-5c1aa2d9e10mr388793e87.6.1794972006813; Tue, 17 Nov 2026
 19:20:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
 <179490321548.3136.12535368591168637116@kernel.org> <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
In-Reply-To: <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Tue, 17 Nov 2026 19:19:55 -0800
X-Gm-Features: Aa3M54qlIUAd0hNudODtwjUM3vp3szpxLVn6rqxVCrMmIBzKBehn34SS0rG8Tt0
Message-ID: <CAEy9hNW=h41aoAaBQJzL80X4BgMM=xQe6Y4_sR6jw3RWBue0sA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-sun8i: Defer probe when the
 EPHY clock is not ready
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, clabbe.montjoie@gmail.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_192009_987106_C6342CE4 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime,

You and the bot are right: get_ephy_nodes() runs after stmmac_pltfr_probe()
has registered the netdev, so the deferral comes too late.

Yes, the internal and the external PHY are both behind the mux. stmmac
attaches the PHY at open, so today the mux is registered only after the
netdev is visible.

It was build-tested only, as the notes said; I have no H3, H5 or V3s board
with the internal PHY.

I will drop this patch and move the mux registration into the MDIO setup,
together with the probe and remove ordering that Chen-Yu raised on the mux
use-after-free patch.

