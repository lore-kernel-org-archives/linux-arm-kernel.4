Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F16606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nJfje4k;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gILFmeXx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=; b=2nJfje4ka/9SKN
	bcaYvKHYSohJBlb7SfQGxIegNbhNAFNyQV/h4plN5ih0oiL9p8+ZwWAm0f0B/vEeQ7zkH5XHMf3ml
	9pRc+84fmAIk23ehWQxLqAnGZtf0/DhG+E9IK5or8BoziD1gQHSUnjqTsHNBzaNclOtXQ21kq/nMr
	2IY1Wh4DdQgMFzIWZ1LOUTsWBbG120ICaPwYAeyUzaZo/FB7CuBuFvXgI/f1qgvl9w1b2WhOab8Vf
	bYUMqXKVjSTA0BiL9g7dmv/Y4DJF9U7+9phyPdEhi4euVdkXhxHudtOiWkyLKmMPNuenO1xMGurda
	NvPcPzhhXcbs7s1TXiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTnL-0000000DsrZ-18ol;
	Fri, 06 Nov 2026 23:56:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTnG-0000000Dsq3-0G6l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:56:27 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e946155442so9538905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009385; x=1794614185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
        b=gILFmeXxNT8zSUVmuuORUJ9g8m/l+waqne5MlG+d4YmGz8EHN2jiOj497ngqViTppU
         7kjnVKbZZ4dHvHN1yaze4ZMZVYRBUdENSQfhanvud+ZOXXSzR4JJWL6P82PCxisFGlR2
         IULiFEPSyxx4oCmId1tKr35hfHcNLyR4g0NHyGdq8+cOUnD8rwB9YFlgptPYRwWbaLaX
         dByxRDjL1t/mzwiLpNKsZjsWIrGJ1jXIg3HrIh7iU7aidlSmLTNaPFtKqK0CH9pX9BnR
         GMuK8AUhlzFDIg+DucKJ5MLWlA0NTKGWzFa3DaQRwu6ju9wFJRbg24MsBg1BU9Jq6z0V
         Yl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009385; x=1794614185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
        b=IG+JNBAf8TvunuTZJV7TiPmEHlMaz7Q/tV+1SBtyD77YRKh1cYiPu/2ZMn/0hZbNzt
         Za0F5AWdzy1gxRASmqcpPRkTjx7SAwvkPD2qIMjv2hUCjBivcJZ2Vh4ISRw2CIhAc2XM
         KDLKk5mbDzIf/2i9UlYYiBwC3p3Iw8FiEzLHUua+NFvPGew9UdH7uqtopKmIRdwRg69H
         JTodSK9UCPSvxHad7PSKKL8sIc0I3NFzHWbgAFzlX3X7m9SE7RBHhMJdZOVhVzyq1y56
         +yrDzeHly0MxlaEUvXRsMzl0a1he5tq+4W4CpPLlRSr5qwI71RZ6UohcdjCGcLEuGeW3
         Kv/g==
X-Forwarded-Encrypted: i=1; AL+hErFz/FX419lN2I2csbwvTJXsThy50GDG3vwvoo/wvaRoBhvW0Dqj4wqslkxuwEPPTgKD4Wj1sfqYY98LLNNaCTgF@lists.infradead.org
X-Gm-Message-State: APuU4Z+R71zHQDEYagMMbETN8PodQK0jUAUGMO93+LzKYg4emZ5Fn7gW
	W1rsxf/KIB61pjdmwGeWMCc9OH02ONepKxz6GG4PUf07hRdAEdNHNfFk7T2OUg==
X-Gm-Gg: AYBFou31OVRp2DJA9B6nZDonyeyrqX0ronmZXoWZ7Qw6PPgAmqTzmXISWBPvTvoDLia
	PjgL1kztXnqv06SDNM7m5ZTcQNhQtDYa6PjS9u23e1OOvhUuHdBMLeR27K2sC07WXIvtwantqlo
	pXDZG9T6kay9+bOIWfmxHjmm5xAluvqeOkU4XXx0x1rovIbiTlaalV5q5CI22beluBznI+jr97m
	pweDTesc6G2oh/YWF2HrjhRTQ2kCziZpKRb+ZuoASqPr1oHzaJe3PHA4LyfhC4CoLdEbrXIqigf
	qnpiGhGhzwiEx95x+zCt9S+RPyu2NR8Z+0erb0ZS9iTNxl2gh9qIZjOTOF+IIn8xCtOJ6soeMfR
	AcwGDW/DxDZyPfPxR3rZcbf4t9j9dnVj82DL5W+0imWlR/HN/GIvPVLMEF6lPGrxrAmlrdol3fD
	G2aC0Bj6nM1+MPXb9njUsrmplVMw005SrId+x8up6ra9TRTWXtstpX1uqqSRfy+nAUk9h+VZHBQ
	HVFCyD8Do2BPe/Np96r07ZwmTJgRspkpP5TvLwfKPFl3ww4flQ/fYJBpqpoJNfwcm3Muioo+fwp
	wmCgH+55YgT5lPB4CFAD
X-Received: by 2002:a17:90b:530c:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3b0db6f4c26mr3934488a91.40.1794009385039;
        Fri, 06 Nov 2026 15:56:25 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:24 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/2] arm64: errata: Fix Falkor E1041 Kconfig name in silicon-errata
Date: Fri,  6 Nov 2026 23:56:16 +0000
Message-ID: <20261106235616.1533003-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106235616.1533003-1-takano32@gmail.com>
References: <20261106235616.1533003-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_155626_107407_D38CC150 
X-CRM114-Status: GOOD (  12.83  )
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

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol defined in arch/arm64/Kconfig
and used in arch/arm64/include/asm/assembler.h is
QCOM_FALKOR_ERRATUM_E1041.  Correct the name in the table.

The E1003 and E1009 rows above name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009, without the E, so a missing E in the E1041 row
looked right; only the E1041 symbol keeps it.

The Kconfig symbol stays as it is; only the table is wrong.

Only the text of the table changes, and no build was run.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afea5e57ab95..f554fa04662c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -360,7 +360,7 @@ stable kernels.
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


