Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E409606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXb2Ht/Y;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eyNj+ChP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PfLWt/mhe3ijyWglwaB5IfQna8Vw7CnfYmlMan//v7I=; b=FXb2Ht/YsaPUv5ju9UDFT5pVJ/
	tgDr0nu8p4lF7lAvmWqOFMVFCOuUeUO9Y2HvrRpzRflP2By0QreV9o2rkuyLFsVup3ryn2/0CG5iJ
	kJVwprO0b4Eb2WwtTFlsQPmThKyvEBEuRZV3jgAyMAxOTWDYEswzmFoSpbX1rWxUa70iuM6ADgjU5
	FvhzGBSlRt/Dy5gR87c/ypjAPHNZ/gIPPiJHqKh+O2FlXqST7tpRjCrFcpVfOwM/TetFCHl7j7oR/
	CyYw+7wauVH7q9QirFqxViq+q+CXKiCrcfhDRxYKsYJWYVGV9il+YA9dpOsoBO9Lzu07Uw6/dkKjt
	y24Nyi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdh-0000000FAAM-1PTr;
	Fri, 27 Nov 2026 07:45:01 +0000
Received: from out-129.mta1.migadu.com ([2001:41d0:203:375::81] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdE-0000000FA1B-2b9q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:44:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=c3dqd6wqmYVEYEGzelsBMY/LDII+k4nQoLCuh/aV6oU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765469; v=1; x=1796370269;
 b=eyNj+ChPVw3fY497U85aRDDOfPiXTDCeakn9BkTCplR9jAnum73wcZOGDODUFuGi/b4nDdxo
 mlmsFzVuC6cHENErWzxT4ZePkvSEO8iu3KTarLzNZTFaTU9D8RAn685Q0y8LyCGM1uc+bZunSjx
 Ebumy5dBIlhga1S6xZpjKoX8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ec8fbecf27420b5a;
	Fri, 27 Nov 2026 07:44:29 +0000
X-Mizu-Trace-ID: ec8fbecf27420b5a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 00/10] arm64: sysreg: More input checks in the sysreg generator
Date: Fri, 27 Nov 2026 07:44:16 +0000
Message-ID: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234432_865052_63D591BF 
X-CRM114-Status: GOOD (  10.87  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v1 [1]:
  - Split the TRFCR_ELx.TS change into its own patch. (Steffen)
  - Reworded the leading-zero error message. (Steffen)
  - Collected tags from Steffen and Mark Brown. (thanks!)

After finding yet another bug in the sysreg file, I think it's time to
stop filling potholes and have the generator reject them instead.

The bug is in MPAM1_EL12. Its Fields line refers to a SysregFields
block that doesn't exist, so its RES0, RES1 and UNKN masks expand to
undefined names. The masks aren't used yet. Patch 1 fixes it.

The rest of the series adds checks to gen-sysreg.awk for input it
accepts while the kernel still builds: a Sysreg and a SysregFields with
the same name (Mark Rutland's suggestion [2]), a Fields or Mapping
target that isn't defined, an enum value not written at its field's
width, a macro defined twice, an encoding that's out of range or has a
leading zero, and a bit position with a leading zero. Three patches
prepare for the checks. One removes a range check that can never fail,
one stops the end-of-file checks from running after an error, and one
drops the leading zeros from the TRFCR_ELx.TS values.

With gawk, mawk and busybox awk, the generated header is the same
before and after the series, apart from the MPAM1_EL12 lines and the
number of digits in the TRFCR_ELx.TS values.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261123075219.369042-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/aLF9mSCs1B2gk8BU@J2N7QTR9R3/

Fuad Tabba (10):
  arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
  arm64: sysreg: Remove the dead range check from parse_bitdef()
  arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
  arm64: sysreg: Don't run the end-of-file checks after an error
  arm64: sysreg: Reject a Fields or Mapping line with an undefined
    target
  arm64: sysreg: Drop the leading zeros from the TRFCR_ELx.TS values
  arm64: sysreg: Reject an enum value not written at its field's width
  arm64: sysreg: Reject a macro name defined twice
  arm64: sysreg: Reject an out-of-range register encoding
  arm64: sysreg: Reject a bit position written with a leading zero

 arch/arm64/tools/gen-sysreg.awk | 48 ++++++++++++++++++++++++++-------
 arch/arm64/tools/sysreg         | 16 +++++------
 2 files changed, 47 insertions(+), 17 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


