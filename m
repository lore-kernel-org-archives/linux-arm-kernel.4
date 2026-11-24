Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A709A606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EvbO7Xe5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUgtMgQT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=; b=EvbO7Xe5x28cgj
	LXxbN9RB+WM+axhLNVJpOIxYbHOMxnEDSo8eQDvmGXEI3fABBiQmhGcnusdQLBIgghndpfEhbnAYN
	mXLHsPSwI1txYHh59S3g6jWqJSHa+CoDRyTVaTX95yVc7nESLFo3Atok1O17mY4hEhXgu9mZkrUNV
	I0UXKdl1J2uwVh5o8VuGN0EINnos/560N+x/vWB6Eep2xp4In270pRvywFll/ST5sdowXGdfuu4ma
	9YZwUv6FD5XhmLVNShJGDOZ8M3i5Z5L+XYjDElPtSu7PJcldujo7YEoOnpoVQhBtQySgWpDB6K0dh
	gO3SQW1kZI5qZ96gQX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVshe-00000006whl-0ylW;
	Tue, 24 Nov 2026 15:45:06 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVshT-00000006wdP-0aRt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:44:57 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2136805c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535094; x=1796139894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
        b=LUgtMgQTGU2vkS8OM9WLOL1UtDvn8zj+RYDYFs6sWjTsNSimySMKEPFDHsFI3snAMz
         oyomqpo1s2pgTqoE5Q0bXorSa8wK93tkWe4E19vPt2GrfHO+2DyI5AW0jXuOH0+F3m7w
         utq4uy7+Dho9rzB6+cDE2kbstGmmB2K8JdfjrQIBp9mD3opHCkOQVmJdT28xBF9W1qXn
         jLyVlveDCbBMtc5q2zQr1Zjoahesnrwk2oaM9Cb96ySDsnVGjkoPk8gZ1ECO5ZRQHl4l
         qbMuVbg9DjGKG4dhE8/bx/V+Yk6Wvn0O6qPFqsw6oE/yXlzYbXPn2ZZZ1rsEIfRRo7b1
         705Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535094; x=1796139894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
        b=CCsGoMO/su2mBzJwAxoYoFff7HXRRw6ABAY+J5JO8VPbJ81WL+oC3QlrFJTn8TFpcQ
         ZEusAVwbH310MbXVNT4vnkcqnoEOQtSx5ljs5oDpLYigXGKLomP1/ems1ySo8cYfUoBT
         P69pb/fiuRtyo5LrwJIqgdQcsudj4AKu2s3GfcGP8pb1EpeOWiFPcJrKFVtDC2gJKAGg
         Qpv1JyVlM6/NlFns4cztEL+vXBTD1ua9ml645zOK3uaCI6q7CNNYBbzFC3FkQM+B+Q6O
         4zNDaP+vUVXqW2htj7nZI0QRvzF6uotST39AUfDCuj04J10dHa+12w/jYcL8a66KXITk
         aGDQ==
X-Forwarded-Encrypted: i=1; AL+hErEj4oaeRDbquWvUA5cdomAcK3am2re9spYm7qBmCT+mkZtVq8w978etFA5yOm7076/pAN3+c1AbsPckmrQTYmDx@lists.infradead.org
X-Gm-Message-State: APuU4Z+GjrZiQwKYnJj1ymCXJS5LmAJsjDqjtIcua1PpsPy/YUaSO4Ms
	jVEct/Q1S5hRhRhj/1kTEOCLWa9eZV4c4i5ns4MBTRZk0Twmu2SF/YVv
X-Gm-Gg: AZFdTZdP6FQFENsHmAPr5uiyA24JjiAhrEaNvinylCRTmj15YgBh1OTlV+2NT+DNYyV
	c7KvstQosR3w2Pg6oJpVpZyV3QULcAXC/GYG/egwvixshpYOvooXfUSoDkrmOSaUMZtX9Wz96Xp
	630FNb5h4k7bXCgtgjQ1h3GmAoeUMc5v7fdCiqDTTOleqkHo/9oqgTvVb8eyisAxeNZ7zCNcM06
	wzMf4bCKA0UkJXZKRBiUUhZKM4tE6bi0DYzPRNSO1qU6L/00RBNoHaxIX1f4XEHlIh89oJFIKz4
	RsyFsH8sLq6OZnlZKtlfLUCBKYTVHex/EzL13oirwFijNgP2I2WrhWzkiAqQP7+KKIE6vrAiiXY
	+DNWrk4uiPvH8zv//EtkiEcgWHPAi6Y8wXK4V9/3pxiA2tsAWoBkDF+Tksy5ZMZx1PtJDvrFS28
	Ejw8Ya5spry8ek+mJtpIaRpAMtuo2bnXR+kjKTRIe7QiRM4Yav2KAubuYmgYjAvJux6MFg/Fbdm
	SZUO54SLXay2b25EGEQu4Xui969WpHARpd1+pjXqX8ky+bkXLMk2IPABsz94GjpwQsA75EisYAC
	lkKgdAKJpnBeMsjvQHiYWCTfIflBb1sd9brNoriYzA==
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr14794229c88.1.1795535094310;
        Tue, 24 Nov 2026 07:44:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:54 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Tue, 24 Nov 2026 15:44:46 +0000
Message-ID: <20261124154446.1094507-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124154446.1094507-1-takano32@gmail.com>
References: <20261124154446.1094507-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_074456_172895_9C029C4B 
X-CRM114-Status: GOOD (  11.96  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Falkor E1041 row in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041,
defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  The E-less spelling matched the
E1003 and E1009 rows and looked consistent; QCOM_FALKOR_ERRATUM_E1041 is
the only Falkor symbol that carries the E.

Only the Kconfig column is wrong.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 5dce49a57864..6e2d94a8d3c0 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -372,7 +372,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0


