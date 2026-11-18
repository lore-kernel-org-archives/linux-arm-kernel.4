Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ipV5cJ26;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O8oka8lU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yvyTQy7QXUkCqUdPoN6xekhnCdJic/iB4Nnp6WsuGuw=; b=ipV5cJ26CXfKedHwKjJS5sPIRF
	7XJR6BJ01u+Yc5C0pzQVEWTHU5odMf2yOp5CLiKwBJ+GRltx+681UQejrXqsvV7QKRihPPhNdaKBV
	tiURTpumf5KrIjswvLq7dQfc2AcZl3cDDy1sdjVx5Y0yDEjxSlO89+zxsOcyovAV62lZuFcFmOEjy
	V0aGcnEhA4HFwaccZuEOOXwxhLK4aiqVyyuSEbb6m2jFYd13HYGkZ6eq3bxgbpfSBLRNwWOhHboUB
	FgEoF0iWzeWOt14w5Igaf4UmZh0EsUKSMSBEukhV77EuLtHChxERNDkSLb5JCNAa0wbz0yy/wohPB
	oWQgnV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcl9-00000008XcF-1KRL;
	Wed, 18 Nov 2026 10:19:23 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcl6-00000008XbC-1IMU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:19:21 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso454594a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794997159; x=1795601959; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvyTQy7QXUkCqUdPoN6xekhnCdJic/iB4Nnp6WsuGuw=;
        b=O8oka8lUQhag7PFrng8woaOhPprZpyndSLK+2Sa9JsTk9UJlSNRO88bjD4J9ZXDzfs
         avDPe5xDTF3jhuFZ8yWJB8oiEBTF+WlYfUMUPeBLAIpO83q/poG7JrPhgCKRPw/ccC57
         Z99FCw56xEn5LIi0V8pNeb5Wm/OFu05pdk56Jb6BdMsV/R96pFqHj7CXvLznoAc6oqsy
         yS9nsaVzzmohS+pQ5yxBlDiZHV2Src4/v+pXLjju/oA8NnewekcDg+w2Z7BZbL3anEu2
         F2LzcyOrp56MFdUnd6TlWZ2wG/VFdgULemRS35nGK8FG1Z2GIZdlfnD35gebA/2Kld/A
         rvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997159; x=1795601959;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvyTQy7QXUkCqUdPoN6xekhnCdJic/iB4Nnp6WsuGuw=;
        b=vOUbIT5rm02Gnz9YTBqoB3dxzM4XRr0DOTeZ/TZt+fB42xo12I4YIt1T/eoeUSwM+k
         Hzup8Vsco/m5ywLGgrtshq+F0Uj4opIzSEMFJ6QOQMfa8gSSJpJR7phpGJGAZIWfGys5
         Eluei/q4iK1/FaSvWCVVyoxoaPFwPwPZ7yEV5v9cOorwXE2J4uIfebfW3v3UqB+ZjscJ
         kZRwDoIa8POVpI+nu0t8KpE2fytNt1szmJUVVU1hTgZhN7sJ23SIAP/c9WXssFdvT6Ny
         UGjVMkL4D24J6LVX6Q4k4DatnK7U03gvEOwszATtpgPBx/4SZ5Ii+IvZ5BrxJ6kRRzfS
         44mQ==
X-Gm-Message-State: APuU4Z+mWEjlV01w5HnyAkbree6b+RxxAhhhVqAw0tZlG7tkwyfukq9w
	doym1hpAlCoN+C/pmsOMHdeKGvsSlNGdqitGCxenucdVLXqxsvQtixvnu9ws2m9x4XTlKC6q6Me
	2XLTjI0uOZb8302b6ORIP1LgLgw==
X-Received: from pjbbx13.prod.google.com ([2002:a17:90a:f48d:b0:3b1:cec2:5b9])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b88:b0:3b1:ba59:56a1 with SMTP id 98e67ed59e1d1-3b3d07ca529mr2196929a91.39.1794997158388;
 Wed, 18 Nov 2026 02:19:18 -0800 (PST)
Date: Wed, 18 Nov 2026 10:19:11 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118101913.3135869-1-amitamishra@google.com>
Subject: [PATCH 0/2] perf/smmuv3: Add runtime PM support
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amitamishra@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_021920_352828_FAB83850 
X-CRM114-Status: UNSURE (   9.45  )
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

On some SoCs, SMMUv3 Performance Monitor Counter Groups (PMCGs) reside
in switchable subsystem power domains rather than an always-on domain.
Currently, when such a PMCG is probed, the power domain is attached and
powered on, and remains powered on indefinitely even when no perf events
are active.

This series adds runtime power management support for SMMUv3 PMCG
devices that are attached to a PM domain:

- Patch 1 documents the optional power-domains property in the
  arm,smmu-v3-pmcg devicetree binding.
- Patch 2 adds runtime PM support to the arm_smmuv3_pmu driver, keeping
  the PMCG powered only while probe or at least one perf event is
  active, and guarding post-event perf context and shared IRQ callbacks
  against accessing registers of a suspended PMCG.

Amita Mishra (2):
  dt-bindings: perf: arm,smmu-v3-pmcg: Allow power-domains
  perf/smmuv3: Add runtime PM support

 .../bindings/perf/arm,smmu-v3-pmcg.yaml       |   3 +
 drivers/perf/arm_smmuv3_pmu.c                 | 134 +++++++++++++++---
 2 files changed, 118 insertions(+), 19 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.703.gf848ed807c-goog


