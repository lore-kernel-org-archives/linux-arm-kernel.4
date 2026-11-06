Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99FE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2tFwfLZm;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QtD+tjS9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mS55piVJmiIxDLjSYEdmjlah1SpUzzUUwdlBrhFXVxc=; b=2tFwfLZmBww0jqgnF/Yqc5IejM
	5QVJ833/gYfZdVTvqzrijUbZMQYI1uiy3FnyELFez4LpXFDKGvuGqvdesIMAqWMQKz1YrRU7mvgW+
	2Wjy3paDv7nx7L9bJ4JI4i2MkM9mjfflJ+sKemoIYdCLsJM57/6c204OelQVKfaIR5xkGZWlmL3BR
	85sBRhi5AQNeCZtdME9jY66jdn/Ph6byjU7g169jKqQ4eVFUgjhFpD8iG/iPomaA/mPy6moLD00ic
	xPkyEMsGf8zM1GrYAuoglntYN6HfPQkmq8RBAo47vX9G17K0j0zBve88TnDCj5QD2/uhvDT/XAaFQ
	djv0BmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOM5-0000000DLLR-0E35;
	Fri, 06 Nov 2026 18:08:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOM2-0000000DLL0-2ANu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:07:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BEC1682;
	Fri,  6 Nov 2026 10:07:52 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 199153F673;
	Fri,  6 Nov 2026 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793988475; bh=5EaGEokxUmNP4DAbaJfVst4VbM98zfSaDMbe3rDMmaQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QtD+tjS9tMU2FQ85v3Q72YakUQ8pedLf4BUbFCdgnjU9fExrWgHVV4M6JWOKyrhpF
	 cpHrI4B3SBUQn0r79Igashp5HFxkHe8/YZTXh0ZZ/VsPQta4nvHSXiXo5RyImS4CKh
	 CYZGkCQf6spYkRQ7hOHET2huXRVWQyhBxV4NvCd8=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] perf: Arm system PMU and BMU drivers
Date: Fri,  6 Nov 2026 18:07:42 +0000
Message-ID: <cover.1793986672.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_100758_606545_85F24402 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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

Previously:
https://lore.kernel.org/linux-perf-users/222d98feab5ca2836fdef69fee9113f6f860167d.1791209460.git.robin.murphy@arm.com/
https://lore.kernel.org/linux-perf-users/c936505c43275f434bce924b7657e42bfb25579c.1789652832.git.robin.murphy@arm.com/

As promised, this a resend of the new drivers which missed the boat last
cycle. No material changes since the respective v3s, just rebasing, and
I decided I may as well post them together as a series to pre-resolve
the Kconfig/Makefile conflicts. I've also revived the BMU DT patches
from v2, as some interest has been expressed from within Arm, but again
they can still be considered somewhat optional as it's only the first
two which the AGI CPU folks are clamouring for right now.

Cheers,
Robin.


Robin Murphy (4):
  perf/arm_cspmu: Add Arm system PMU
  perf: Add Arm Bus Monitor Unit driver
  dt-bindings: perf: Add Arm Bus Monitor Unit
  perf/arm-bmu: Add Devicetree support

 .../bindings/perf/arm,bus-monitor-unit.yaml   |  41 ++
 drivers/perf/arm_cspmu/Kconfig                |  13 +
 drivers/perf/arm_cspmu/Makefile               |   3 +
 drivers/perf/arm_cspmu/arm-bmu.c              | 541 ++++++++++++++++++
 drivers/perf/arm_cspmu/arm_cspmu.c            |   7 +
 drivers/perf/arm_cspmu/arm_cspmu.h            |   1 +
 drivers/perf/arm_cspmu/arm_syspmu.c           |  67 +++
 7 files changed, 673 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml
 create mode 100644 drivers/perf/arm_cspmu/arm-bmu.c
 create mode 100644 drivers/perf/arm_cspmu/arm_syspmu.c

-- 
2.54.0.dirty


