Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97461606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HguJ4Dfj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yt3HVphN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=; b=HguJ4Dfje0iudDpSV8+HB4TWlk
	w//VEcvfozaClKh+LuEfBOjxfTZ6T4Hz+sUOI2KdodS3G9/mNSGvvIBWa2PzIbtzrCAYSIdpMvmq6
	0Wdi1ewojKGXU4UtRsFocuIFXLUiDUz8k0aN9FAPgxRhtZQ4KyI8+Sn8xmZdgwnPDfZTFDS4Cqs6t
	h4Txs24qAAB3qcJjGUboPB36Tdvcvl5hgL9L0if1i807azimJoDWcqixwLMcyTxfM+VBpdUnzJoHV
	Ia52cQAnq2iQ7BvfOOWsOxE8cv+/bjRPoWZbHoIlq0h+1UcujwEF19WyMw15rRzvDUa/SVeERZFem
	yZehYYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBc-0000000FQ9x-1T2C;
	Fri, 27 Nov 2026 09:24:08 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBZ-0000000FQ8k-0bd8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:24:06 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso5276939a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771444; x=1796376244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
        b=Yt3HVphNeNUi8LRLp4O5DqbXIwKyOPDI9gfd/xWxnhgyUo1m/o3Vf7O8hOevwtTu0M
         NBCWaa0hvVULHTdlH3jLvqeM4b+BzM/wOvuhD5Popsl8dqqYNWyT7cOTWjb0TvgvunbF
         K3PKIBgPfe8a3PtwjRPVLFFpszmR7aXHv3oc2si8UgT/ILoKfKdspbvaY5bVy4O+nMAA
         FjUrFBtGatg+rhtSwUN/phAbN1Rr1b+EXLPr5RnxWj9uqLfYdXayXX+DCABPTCmGF4sM
         0A8TwKplkM0DcskzIejejmiXko0M7qQNY+8vBL2Mx5us8F9xO6XkEdHgIQNqMnnywgxF
         0YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771444; x=1796376244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1Uuv3s1OBKaJBzE3G5+r1JPdIOySBnabwRbvvXOjkU=;
        b=Y7y83PCsATupcC/aSS41cbP5DMlp+P65ccM+lC0XLGi05/pshOEQFrptLYNDPb5cDW
         +JCXx8TgDy/tJfiKcBrnREh5n5HszWzWk01FmN/7XXL7pg/vayNM0eHj3Uj0Yw0J2PmS
         uZ/ni02K9bszShyouSuAWSVNv4ntL7RLjQ/J8ecIl0DDY2wrYph9O/bP1bdiRdB1WRQY
         Km0rstWhQdYyqZhJqtRJbTdDIfQAi7KhPaDcIwD5LRMfnaK5JwxVu94TnmfEwttYywhI
         WPGeG8rQon1g2OmgERzRUP7XWrTG3BZSz+5lnyIPvR59bgHkgGTeS+oWfpzsDHd0rVtU
         Yedw==
X-Forwarded-Encrypted: i=1; AL+hErGDv1ZI5NhOkfuSTCOyA+xos6aBAG09QSrjL/HY7X0QuDqZ2+jm8ozGc8PRjqCXNjuq6du4h4Kx333NOvKPt6Zd@lists.infradead.org
X-Gm-Message-State: APuU4Z9f6D/XFjcwhMF48jB7qL4XMqCFUiMhaRwBw5pO2e1nH6GdDuL6
	7GHyYv7lDOpO6eMi45JNsFwotkXBNdN9C5hIC9aS9//Fyv2COIkn2HHl
X-Gm-Gg: AZFdTZdyZdDY9ZVeexL5bxxhRF6u72KeVdNB1PaY82A4PPErerTNSXuyDbds6VO/OBf
	xPkwWWzxLyEgHsMiXwwNThuSrRr8iAbOdpyFKCcQ6HlXPKyP+00WcGLeyNKSo5JhlAH4en6ePlW
	0+fVzca7fyx6T2uhKXf39azeQs/oac6K45TrBTHLIa0sb8pqMqLpMm8Sqlgpx0nNKXyvKBUgFUC
	L3fEDVcPnqK7dsbjNcZcEO/JX6XkEXPw0BAkaQItxDkrd+MbB4yeE/EWy8pSMiYMGV76F2nwjNf
	rYpI/3lx6/awpJUxX91vPSUesa4c1fq9XYKCRWJTLYmTZbtW6/oU0YbpwsWJNVyXJlWp7kEvgkf
	qCQ5nd+9QZ/Eay8hnu7noHM9FoLcnn9CAKagshB1i7Uclm/4Hl+UuX89pdGvubPj0mQOr1pERjU
	k+8dWizhzOjZg5pxLS/7WAxxSAvT7U2tZOEq3sJ7r6aWri8aFZOJezZ9dS1+dh3jj3QM6HvuNNN
	9mdOFBihxqTrirh9Y6ZLjO+Lf6zqPWrdZ9tGM/Ni4juKIpJAPJj+nwi1yN932nM18PGk7i1Gaj0
	RjIlME12Iax8Td/xboTrgdmKeKxTf0CAQlIkyIjiuPsuIzytPmNrDHS3Gu8vEmgUcAU00+TcrU0
	8IoEpPVn5akJQ8KwSIN24ec4YXs11Jmbpx3/IdRkLU/0Km8oeCiOz4ConL4fPTq3hdw==
X-Received: by 2002:a17:90b:4ec4:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b41cafdb88mr22056327a91.45.1795771444055;
        Fri, 27 Nov 2026 01:24:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:03 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3]  ASoC: stm32: spdifrx: Fix resource handling and startup
Date: Fri, 27 Nov 2026 16:23:42 +0700
Message-ID: <20261127092345.12383-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012405_190697_D7BFA0EC 
X-CRM114-Status: UNSURE (   7.69  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

This series improves resource management and error handling in the
STM32 SPDIFRX driver.
It also fixes the refcount handling on synchronization failure and
ensures the clock is enabled before setting the substream pointer.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: stm32: spdifrx: Use devm helpers and drop remove callback
  ASoC: stm32: spdifrx: Fix refcount on sync failure
  ASoC: stm32: spdifrx: Enable clock before setting substream

 sound/soc/stm/stm32_spdifrx.c | 87 ++++++++++++-----------------------
 1 file changed, 30 insertions(+), 57 deletions(-)

-- 
2.43.0


