Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA94606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OcT5ZKhq;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXvR0r3j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wiBV55UiQ9z8iTuK3YaAzLsgbV9kG+r8B4QK4xmoEeU=; b=OcT5ZKhqXB11idZwSnNj7k8ubL
	huWk1i6XrwGQYuLR6CSIOvcUp86tKdlUjSULMoVuMX1yBYqYT9REfW+bhvkc0Wt3UC9mUs/oJpMH0
	4HwyKBu0HUnWgdjVtc1No6wpp6oHS9deL03zXNisnIRRnt7JniTXohn6NdjBMJW7yXEfnAeQd/pmX
	/+zYJe1M/VXrSH/DNosusLKTObffGyKbQr6v34wQp9MJyi1oj8W5rz9uwPSFRaR809Hra1yJpJI1a
	xTElXwKIQnZZMyEyFpf7oR1VUv2zTdWJ3pvoXZdzH9iXyuJsr7KfzymclbT1pbJmW2JeSMeLRZNlV
	DuukthLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJP3-0000000BEe2-2F3x;
	Wed, 25 Nov 2026 20:15:41 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJP1-0000000BEdH-0K6b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795637739; x=1827173739;
  h=date:from:to:cc:subject:message-id;
  bh=760j/5/P4ra5RcXbJHQ0umixXSrs9LxuijhlKqkPzAY=;
  b=hXvR0r3jflj3jERe1mrMEMXy7ppSsvn6u5Y812BkERaHe2oM5bdmlpE7
   7XTirZ/dBoSuiqL2EctiSXxHgfvIHSJ/2XnR61/MTpnqHZcdKEaUYNrDJ
   97Cf7b4sqUHpa+nrR4k0rc9bRkpDPXoxPiQ3pIIkPBM4YDkijI+fkiqpT
   Fhh4cQycdAGA5sYro+3hUri3siLeS7qBwjyyKJ3QjFhENjTH11mODqfEt
   zX2+kkOmYG941PdZ67bU5R+7ctujsTa75KfmCFHMPhamfYFhqSpVcJJci
   mpZxffmbhniD+gii9fuUkELo/FPYcb+gnBi6ad8OwWKdb2rRcTGodBrAB
   w==;
X-CSE-ConnectionGUID: OXzaWugFRQ2mrGsaa4SxIQ==
X-CSE-MsgGUID: DMzjLNuBTIi/JekhaKxLRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4412544"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4412544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:29:59 -0800
X-CSE-ConnectionGUID: zPN+fDcrRseDHVxpR0y86Q==
X-CSE-MsgGUID: 7CzfZJi9R36bAw+GJa7+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12380482"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2026 11:28:57 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWIfm-0000000003v-3irM;
	Wed, 25 Nov 2026 19:28:54 +0000
Date: Wed, 25 Nov 2026 20:28:10 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:arm/boards 1/13] htmldocs: Warning:
 drivers/tty/serial/Kconfig references a file that doesn't exist:
 file:Documentation/arch/arm/sa1100/serial_uart.rst
Message-ID: <20261125201757.fs0nwqZl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121539_129650_3A4A8316 
X-CRM114-Status: UNSURE (   8.61  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/boards
head:   273a6e23f66433952300d1810b5274786e7e4a25
commit: aed54038a668c435e3a9ce99c15bc117017bd246 [1/13] ARM: remove sa1100 platform
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261125/20261125201757.fs0nwqZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125201757.fs0nwqZl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: drivers/tty/serial/Kconfig references a file that doesn't exist: file:Documentation/arch/arm/sa1100/serial_uart.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

