Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A50606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 04:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1cUMLdOU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJrn4Hs3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=; b=1cUMLdOU8D5BR2t8VHnWlNm7qF
	MdfR65iHyktamIcEYMICbvztJELrFae0qywEtV7ygxDzdNX7+3JKyy4lDmRSF0PL/rYmR1cuBBHQy
	kpoOfCtykA2j4qbXJ0IYXv45fLQii8ntTA0LTYureBm2+frXqpnecuI1qEXKd+TIcxJDKWC4SlilF
	VeH1pXA/JDYFOH8JEcZL21ZOr61m/mPRQZgqF+SrC26iiJI8I3yIbhVPSm2fLAaman4U1N4/8JNr2
	hfGdaFhjSWM8CBHMUHiWYWdM44UvB1/2FQy2XtcfxhxcwrRMrUXmwc5PUkHaPu/JbpChVwcoYZeJg
	HsXkT5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9Ww-00000000M5g-0Vv2;
	Sat, 28 Nov 2026 03:55:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9Wq-00000000M59-3vU3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 03:55:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2f03f3631b2so44367365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 19:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838112; x=1796442912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
        b=dJrn4Hs3jLVkrE7LtoCM8QtH16eSuYuFUetvz/TiXoqKalGMImib32AYW3nuRUk1G0
         K/AyGP+7WkgOCPjBZ7EHoO45w1QHEgOIxHjG/ReVOey6pzTt7z/63NgZXrj0Poknhxy+
         31YIZLxmpX1Xoyfy71NNnMJzAF/lAE+5xv6mk4FlLaxThL8Nh9ivyGvugRwQ4ko3ikJP
         YbQKccVrB7STO6ZOxfoUZ3TDILOdItR7yTgikEdjTeeEahZew1pf5XSllTu6oaBNG6kd
         F4Sjve40t0yxPE6c8F3sRzFDmqBRiZ7WLCUuhRwTsg9pZoByZCltOcXWApr342a9g/uK
         805g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838112; x=1796442912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
        b=f8QQlA3/GNJNSsi31nD3wYWI0W649xjmMtAsehn8oQXkm3axSZrvO0L4eh1khn3VOo
         xGmlHK/7vVUamsrUWUf5Du7VviUIPMp4rlyZCdZfYzz66CLeVd2Dwz4hqXAVrklniJWf
         q0JgwgFSD2pyO/tAFxwzyni4AR9yxtVl3pKREilKp9Htsf2AamISRLzQyKdqKqLzzGoa
         nhnAlIhOErgs6S37l0PjfdXUs2Ojwp4pshtPRqJGK211ohv6xV1r73Nt6XfvOvXIbBjD
         UOlCBWWHSTuWa/Q8T4DjFU9upIzAxv/mgLeGaWXXRfeUGhe4krmo0fu2ZX/IKfAYibnu
         mi9g==
X-Forwarded-Encrypted: i=1; AL+hErH5rrjEJ4UHO8iw1jHyl+ihtYCT957P/9cE3rNRCUPvifg0u5iBdE2yOet0khc4U8dg8P/sA7EXOhzGLXq8t89F@lists.infradead.org
X-Gm-Message-State: APuU4Z+VI14/DXreaYVGyRBUo7pZE7tA5z/Mfvc3dXH5NDcs3HA/OJIs
	orM6Wv3zxq6jc1YLxU80ZkB2wxb41LSImzdMniVus4LFXungbtS/EdXD
X-Gm-Gg: AZFdTZfjT/T3uziwFP59QlxE835doRehw5Tl/G2c3ieXSbgpQd78cayiMgAi0XahH7d
	YIKnbTQfE9MegqGVYKRpspJawRkFnLXcHF8NuSmJerkWffN976N9VxLYo9SivUNaIegdCbnDJJd
	hKH29qVncf0+z6jbsL4NTUSEbYl88YGDBIgzA1xZvo++1y0DHoxa+LGk6bQLY/0NKzWLcpc/Yk9
	fq+IbrkZ9szT7vFDtg6j0OKM8YrVaMOFYQARAIeQSVK57KwFTryY+9jidV4b6eUN9mXIv76v+vC
	mWjpqrqJZx42jJGEq+ENnEXK2Ojtp/MWwXiri2zPEcCgJoV2nf+DWL5XjOgMLWM27vMSyak+hKA
	j9RlNsR67YkSgTCbEUYUXIHj9nL4bKmtC7JIQ+nV7zD6tcXOnj5bXg0INNZjzwX7CmqEcxP0tcl
	69v4vMOG/ePWOQvBhhGlHDuz/M513jrsHebnZlJeY5/Rtwsn+HPfCL60aD5P/h+dHceLy8BCY+n
	eA8+2GTG3QEZE+OUIMgrdcL9UDXF+bB0TlGOFS+6QbX4QPB7OiZ+H2UhsmtFUPh6GuEp9Oek5OU
	UCarlvhTfY10z54YGRJZjOKBYW4=
X-Received: by 2002:a17:903:41cd:b0:2ed:5548:2989 with SMTP id d9443c01a7336-2f03f20115cmr222838275ad.30.1795838111725;
        Fri, 27 Nov 2026 19:55:11 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:10 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add phytium
Date: Sat, 28 Nov 2026 11:55:02 +0800
Message-ID: <20261128035504.760778-1-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_195513_006949_972311C4 
X-CRM114-Status: UNSURE (   7.95  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chen Baozi <chenbaozi@phytium.com.cn>

Add the vendor prefix for Phytium Technology Co., Ltd.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93..374568acb2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1331,6 +1331,8 @@ patternProperties:
     description: Phontech
   "^phytec,.*":
     description: PHYTEC Messtechnik GmbH
+  "^phytium,.*":
+    description: Phytium Technology Co., Ltd.
   "^picochip,.*":
     description: Picochip Ltd
   "^pine64,.*":
-- 
2.47.3

