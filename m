Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD194606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t4g3CflL;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PI4HiiE0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cwa8Jp6K9oRWTIslw+txmiwix1LoNUallA1JgDLgrsU=; b=t4g3CflLDyUdRf4Lm58uGrBlG0
	PK8i5oYH7z0Vw851n2uAksZ9UGlK7m2bxRQlptV2fdGBvOhrzdSv+Rcv0LLNUBITOL5U+b7DXmBSw
	W7BNNoR/FORmxqvWAMos3ew5j3VESB2/AgHhThnxCZUc+NAo9cuGIytQectAFM+M4HLwHA7p2Mjcf
	u97FYN6x07AZZaITi5XvtOFCncjSBEUiV2x71F05ZzT70/DDMHg274JVlE+j2qAiToioqqeGqq5An
	un97nnxaAGMTBrkJtKxjft0VfVXWlgUw/rvqNxALbmJ9s93u4dOfrT5snk1TvZWyBypqU3syJcQJn
	JIszKWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTk-00000009yuY-0Aht;
	Wed, 18 Nov 2026 18:33:56 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTZ-00000009yp8-3FHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:33:46 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-490c1867460so804867f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026822; x=1795631622; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwa8Jp6K9oRWTIslw+txmiwix1LoNUallA1JgDLgrsU=;
        b=PI4HiiE0tF9qCnpIUNTXWWeet0feY7E08QO8JIKmI0pXC1put2U5oSxrwrt639V8Tf
         6DjJlpY8QgghHqh4zsYjwZqtgm4IjuS5A4PLS3YphzTI9c7FGCc6VZ7G5BYbqQ6Avs1Q
         7Sz9Ev+JJ4Gi1iflqH7vBEMsNmzlLkame4peVRUir1WkrIuuq5CiXqB7LMA+Q0oPZXdH
         KgRxAvW/N+Ljn2zmpSa3s7dhXm2H+MgTtQY9vmH0XZ9oLUnsRH2aPH/6SaDtF9t6Wpc+
         7XyUfMXqttQi10smC1ERee/mXFtmoi4k+n2JFBIcYBs0ihIm2Y9F5g72wDpdGgnRc5Eq
         rGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026822; x=1795631622;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwa8Jp6K9oRWTIslw+txmiwix1LoNUallA1JgDLgrsU=;
        b=uHsQKuC69Itf0C35mhNSdkC0C8kLC/7E0eYafWJcLt8zl7C7e7sF/yni9ORJeCJNdo
         wy1pWDOaO4RxtXnH0DkDYLED745rlomt97TwKBa18Ld5h+Y1b5RsIiiGBmM26VCWeTQ/
         mB2Xxwe9EbY9E2pBiG9qlkFD7Ai5xb+E4LI2DY4c1a/g030Kg0+Ux4dgMxAaHpcIMx+t
         Vthq5LtlGugd2IQG77LR0RWpUnO2NylN/aCfp1l/h4RKhFVTl+K93Nuwz4rIAghO5Vt7
         0Bmd+tsnbLmia/w7zN7Q4wIR9FpJMIQp6OWHuCS7qnGgfhSbS+jWK9V5DntySztzw9/6
         TrgA==
X-Gm-Message-State: APuU4Z+kgpmFjzNxiJz5l8rM3gzJztZ4+YIIh7DwbOKinKWfokObVX+m
	h7jsHBN9W9G76iTjB7EMDFtbBpRinfwQHr2WdOIJ5/H/gz5YwiO1G9IEyS3EW/8rk29YVH/05tj
	V7VkKcPM//IuhjzTxFn+Glp4qU75y5ZrBMF3i9nY7x0sORXaNKQUDYZqJcBUEurndxgpL7kUSU7
	5URIqf3kSeT4dthK8U5yofmDLTD30+mqSLF7toiLt2dzeJ
X-Received: from wrtv14.prod.google.com ([2002:a5d:610e:0:b0:48d:f8b9:6520])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:41c9:b0:4bb:7033:c938
 with SMTP id 5b1f17b1804b1-4bb7da186f9mr57309685e9.14.1795026821952; Wed, 18
 Nov 2026 10:33:41 -0800 (PST)
Date: Wed, 18 Nov 2026 19:33:36 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=ardb@kernel.org;
 h=from:subject; bh=DVtvjJCrr5VaK8PDbC0N3NwR6p24RG9n9QbJYzni5xg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevv+wae9ee2TFl84+T1Su+ztuxTFA4+vePdKSW3tarq+
 pZ7IacsO0pZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE+O0Z/vDqPeWzvXfvl81X
 wYa3r0RDpziUdvQzvtp+ZLXStmuHQyUY/lf1lcy6zGnYGXMoaMLM1a9nrH9ddMJ7z8e10e+LFi9 eVcwLAA==
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118183335.1944213-4-ardb+git@google.com>
Subject: [PATCH 0/2] raid6/arm64: Use aggregation and 3-way XOR
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Demian Shulhan <demyansh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103345_823725_46D36752 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Tweak the arm64/ARM P/Q gen/xor code to use 3-way XOR instructions where
available. Details are in the commit logs.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Demian Shulhan <demyansh@gmail.com>

Ard Biesheuvel (2):
  raid6: neon: process four data disks per Horner step
  raid6: arm64: use the EOR3 instruction where available

 lib/raid/raid6/.gitignore             |   1 +
 lib/raid/raid6/Makefile               |  19 ++
 lib/raid/raid6/arm/neon.c             |  44 +++--
 lib/raid/raid6/arm/neon.h             |  28 ++-
 lib/raid/raid6/arm/neon.uc            | 196 ++++++++++++++------
 lib/raid/raid6/arm/neon_compat.h      |  22 +++
 lib/raid/raid6/arm/recov_neon_inner.c |  19 +-
 lib/raid/raid6/arm64/pq_arch.h        |  34 +++-
 8 files changed, 267 insertions(+), 96 deletions(-)
 create mode 100644 lib/raid/raid6/arm/neon_compat.h

-- 
2.56.1.708.g77570a6a1d-goog


