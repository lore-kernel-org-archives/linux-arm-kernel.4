Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E17606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=et/0BjWg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZnyEnNK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=; b=et/0BjWgUcb4FxsDUoPlqO8Xsb
	eWfC+Z6obaVP4s7F1jsiqMf9LHDGZ1VuTjE4eqqxqeKWX3Lcw3gU2nClm4p6NyMIFa5ukiOgm3bSY
	RFUAu1r8DVlvd6Fgxw8AMkTPORrjqQyN1QFBpU/p4UJlz7vVoTbcnCBjT7cVCgUUp0o8fVNAcZQtM
	bfTa3QOCOTw4kG+4lqfnXsGciW6iMeKXD/Bs9DPTs+7x93cOMEfWyhZs94SB4VmOz7Ki7npg74yBl
	70zeynLnJvSrfm7UIAsFf1UI5MxPwImwcm5Ptraeu7O5Iu/6co0KLPXWc7U6kAtbolKQIK+GBH4WO
	dTe3tzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlmL-0000000Bv8C-09nu;
	Fri, 13 Nov 2026 07:32:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlmJ-0000000Bv7S-0zKF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:32:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4918c2d727fso238403f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555172; x=1795159972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
        b=gZnyEnNKdtrlAokqU7NFk8IoVnjJH0nQIIkPO6F3WQiGuGKrByGh3jq32SBWS2kB2p
         po8rPd4LFLNR2OgavsOC5ZpPJTsKDGy4Yq8UTFujc/ErMMv4AyGB+ZNQH2gE2On4uVNJ
         pezr1L7c7cYZp31jCY08VA4LUII36UZ7anTGOo7u1oN/IRKOBqRTYcKwjlr9XjJ6dgwH
         EoCft6gAgktQWxxomXUEfSe5g//rBsJ76H5aU8hArz2NZ5qrSO34wl1YFwlQkW9nmrYG
         44iaWmcWnIQ7/PzgtSt7X5KB15g8nGMxmFkVle+6SWGtjmvQZKFkVK7cnzJeugOP4nrW
         wOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555172; x=1795159972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
        b=rRPf0EJFIZ7GaxzgWmZyLmASLd5K8IKJ5ItdexWOl5vvfOsZ/1iLYYkHxwgnkw3afh
         OZoABnwUL517afc2n0na1t9XVjP2Rx8e7H0L5J/ZB/3orLBkeQp/ktjpW5U5GVXE+JT3
         uvsFnUzL96axS4naLR/BH4ABzXwE9moPQDzeLKJGIVAgICIx7TrKVUc+DInW2kq00mPZ
         bZfxZWk9MVH8TI9DG5MboSCE/Vg6fZy89kVat3OZSWi6DiHl57rDECH8jG5gKJsR+qmq
         f27WMwGtQtyfp3oXbgAQe/XhThFoCpYc4B9QoCVHN0HXKBK7Wpve/JI6cRUZwc8SBJz8
         nlmQ==
X-Forwarded-Encrypted: i=1; AL+hErFnr1LiMIpLrKtkWD0QhK0mYKf9YIXzEJ9WeTk39z+gBn3oq13LYWnLYkpW3tQ8TGzISikEegkC4WdUuUEOrjZQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8CYyNO0DC2pJBmpZGxYM9C1j9g8ne9Jz2ykFwM1ZyaATHnxOZW
	wFrSrr3y4KoO5o4e1ZPisG52WO35ekCdcd7+L9xEnmFEHPit6L3gZ+ux
X-Gm-Gg: AYBFou3DIGaRGzpXI01Vqe5R8PjJdZCrVF7MxgRQQR1Ek2tkJUPta5egZyKKg52WDHD
	ik2PpVNSzCnPg6C7BfAtlP/qEv0PyaparLx92Oui+uKxLxZgN/e8ar7qAmRqfg4SUKc+vo/1sT4
	qlDjDQ1IadGK9rTvqYXBAtwI/pJ6w07u5Sc3/iJ48aSDkqZQBqrt6WS9p+hLTaKT/0infIRm7Ug
	mlbZzopwrusykeVTXw8GwuelbBKa8VeC0cxZzUJDj31/8LS1Fk7VmjL0kAiAF0jO3c7diDqMRHT
	f+4Q2i+jlaB9ClaAbmvyLaEyloZjZ7hD9HyrSP5tYpj+Lkw2utJvq173q7jOhO2I5a8XE+ovFZi
	hbPEDTJtjhzXcYp2X/n+E+r7nXLuC80JqnKe6KEu4WdabiIXk8Fk+jlf5hK2tuhXMVMdxBB3eUS
	YULdCCfu9L/gX/sPIXjZGV19c+vV4Aw7UpNbHIqZMZr+Q8pdoFzaY8vVrFiZiRDkYMlVZ4SR9EN
	mO30mxS/mY73AL9Zx6ssVMfXtz0lIBBVRp+Ixjas2qH4PHnScBrmGbsBX/H4X+UJy4r38Qv/JGd
	IMHeEZZPj5Ft3YD5AmNODMKpIYC5dMbosQI=
X-Received: by 2002:a05:6000:240b:b0:490:39ba:4359 with SMTP id ffacd0b85a97d-49c714a2db3mr3596058f8f.23.1794555172357;
        Thu, 12 Nov 2026 23:32:52 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] i2c: imx: two fixes for a DMA write that is not acknowledged
Date: Fri, 13 Nov 2026 08:32:48 +0100
Message-ID: <20261113073250.1037215-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_233255_280785_DDFF379A 
X-CRM114-Status: UNSURE (   9.38  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A write of DMA_THRESHOLD bytes or more to an address that does not
answer leaves the interrupt status behind, so that the next DMA read
returns 0xff for every byte without an error (patch 1), and it blocks
for DMA_TIMEOUT before it fails with -ETIMEDOUT instead of -ENXIO
(patch 2). Patch 2 needs patch 1.

Tested on a Colibri VF50 (i2c0 at 100 kHz, DMA) with v6.12.117, where
the touched code is the same; on this base compile tested only (W=1,
sparse). 200 rounds of failed write, 32 byte read and acknowledged
18 byte write: 200 times ENXIO at once, no wrong read, every write
acknowledged.

Mehmet Fide (2):
  i2c: imx: do not carry the interrupt status over to the next transfer
  i2c: imx: return -ENXIO at once when a DMA write is not acknowledged

 drivers/i2c/busses/i2c-imx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)


base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0


