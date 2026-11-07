Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED06606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4FjAcujB;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O5K6U3Yk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E3RVJFr6ZUPogzBkgGP2loWx7cvpSKnyKS/nkizj98k=; b=4FjAcujBgPbDGw9EgJcsDY+6dE
	139A4V5wLcoxNS8UrGhA9ZpIIXhxgsSTwC9P4vx8G6Hf6GYu+OyymFkafHUh1lbQcqwt18u3YMVEm
	XRoIXTyzVKTFRPSNdwHlPHlvOqy8P/EPg6lh7jBTVROi+7RvsoFBMJ15R8eUht+X9V8OgpyRkuWHW
	Vuq4X9/TAg5pqcTZyui4IiiwgfJ1mdADVkuHvAATdY2FUZByanIJvXW1HcP2hNsYw5dMx8FYgSTSa
	eyXnT/YO7o6r0IkhYkCVPYazn7Xz//kkTvjyJi7+KMBAmGcK2jEKNMNwJJfSGgN8OWzGzXJSW/elY
	rupvfSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUNj-0000000Dvm0-2aAi;
	Sat, 07 Nov 2026 00:34:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUN6-0000000DvgM-0Exb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 00:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E3RVJFr6ZUPogzBkgGP2loWx7cvpSKnyKS/nkizj98k=;
	b=O5K6U3YknfjGidM7jM6CHGgT3dvTMBRHP6se8UGqSFmiQKX2DUTEy/D5wlgYRBuskFtNwA
	SL6gezn2grCqBe8flVY7sBI9QRYtnrGiHzVeXUr9Avma7grPsVUqeIb+RxcFzTxrTboqr0
	HvwApzw+Ya0nI9vjs/d3Gorya68KuGM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-cRwUU5DyOeixn5k0rEf5IQ-1; Fri, 06 Nov 2026 19:33:25 -0500
X-MC-Unique: cRwUU5DyOeixn5k0rEf5IQ-1
X-Mimecast-MFC-AGG-ID: cRwUU5DyOeixn5k0rEf5IQ_1794011605
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so279991885a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 16:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011605; x=1794616405;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3RVJFr6ZUPogzBkgGP2loWx7cvpSKnyKS/nkizj98k=;
        b=PP8qF0/kHX/N4Ld9gpNuqluzQg4I8iTMIWcy2FUYf+Z6kyHCXj4UcbSY+8duwR9EMF
         DL4vTl4Q7fyJ3Pw2A+8YpzdwqbamRSAqX394d/QwuWsmZ51UjlzqEw+xFi0S626Q63iL
         xttZ/NJIPeYbHNDC0HyWbZNh35HbmNUI0SCNMD5wjT5etvTCLLEeYSnJ/omEvNG6Ryeo
         HJ3oN72qWjCvT9yArSWbc2r40xPiI26fZqT/tmKViranjCmKdHNzFvXoX1AAISGkwJaD
         o9zTfxR2TQ4X0nfcrh86ss9Zt73FUE3zfaamcKx40wBHyHzIlMKwmJ+rxsRuXTxR0ZD+
         F6gA==
X-Forwarded-Encrypted: i=1; AKwUvByEVl9Rf3Y++Fhx2esu50OZHHO2FPibQXRSY+Hq5n9Pt75wV+LaFwuzGd68/RBknLt+3gDF5PahZB2Z/WxDHX3Z@lists.infradead.org
X-Gm-Message-State: APuU4Z824GnWFKFTCGGMWUxfX2JxXImP6THFp4+6mmZw4ZzGHO6e0VMp
	jnsJKTB33w2q2A+ZGwRoWjxmkNOaeaZOUhZMBPuJJoEoXaq2ycy2ItDY482QjPQ9tWhP2/Ruvpa
	5neVSdOcUK6FWVxGNkv/A+e54vvrbnbTxgLMcfjQtIFLfbP6uLaa8OEyW5B2g7u55h0X3plZUdq
	v2
X-Gm-Gg: AYBFou0kTkY2CzQPbLiLQiW3gHENMrlrUVJ+B8cOjg0yvinJdt3NFCXlh3KtGXdNOxK
	nr85s/S0H19kjYN5ManMpvsxQ8ak70msU85tANSGpPDnVX+CSOrPJFqIXdPAOipBdzkUA6ZqxG4
	htv+LR6a7AJS+L9khPJK7bNofi8s+NLBF/0+N78KAVnNolgrw8qTFOrMAk+fOJYC3d9rZHpgaJO
	HH9lj6OGsBhIhQbqOSgX/3zLW9oYmEoEPwdt5EAPwVqE9e9kBmgP9d1HBu3VQ3k5ffDPrISclAp
	yIwlCiX5NX1kiEVFGnfsnGG8vobXH/LhVc/ky0Y0t71BKrTmwpWxmalEU1kD+RgHwne/s06nimI
	pdsY8TJS88zhMxswhvo3/PC67ByhJ55HxU6qTK/2oSET0z1G+EUsNCrBYOox62ZhDipmbq3Kanx
	+6/hjhAc6Obn0WYtUf
X-Received: by 2002:a05:620a:4541:b0:943:e135:525e with SMTP id af79cd13be357-945f35df6aemr679392085a.64.1794011605025;
        Fri, 06 Nov 2026 16:33:25 -0800 (PST)
X-Received: by 2002:a05:620a:4541:b0:943:e135:525e with SMTP id af79cd13be357-945f35df6aemr679386985a.64.1794011604452;
        Fri, 06 Nov 2026 16:33:24 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm32684126d6.10.2026.11.06.16.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:33:23 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] spi: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:33:07 -0500
Message-Id: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4as0s9akLRpxFbEoBmNB00GIuLti+
 SXv/RcwBkKGUlwQcCemZY7QiYB2dPOAkrpoMMpYrZWV7Eny1vDJMjU6t64rVKZSiAcfsKfji1X
 177icsF3fAtz3A0/01BtuAAAA
X-Change-ID: 20261106-spi-subsys-32156ad80403
To: Mark Brown <broonie@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cIQXJAsIsjkJ34lMdb75pVRHd+pc+H4nZCxj/MzmMlk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFZ5qcOWcvczJwniSi3iPR8yiM3Uf8q/N3WDFesZar
 f6+qaNiRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5acHIsEUhtY+b/+OxZQKx
 76O+fbW+puK/avkau+k3A869usQrpMXwV36KfIX6uqAZTJHyU7sMI3qvfH511WPVr/fKLn4r6nn
 9+AE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nR3pkpNNS8dFobT80aReBcGW6HqqNSushp1_q5fU5vQ_1794011605
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_163347_752220_F3AD2CFE 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      spi: omap-uwire: convert to subsys_platform_driver()
      spi: pxa2xx: convert to subsys_platform_driver()

 drivers/spi/spi-omap-uwire.c      | 14 +-------------
 drivers/spi/spi-pxa2xx-platform.c | 14 ++------------
 2 files changed, 3 insertions(+), 25 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-spi-subsys-32156ad80403

Best regards,
--  
Brian Masney <bmasney@redhat.com>


