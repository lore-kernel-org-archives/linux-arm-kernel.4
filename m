Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97AF606A898
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DKof8m1v;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TtyDaimb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=na/fJsUdW+mes1yfquIAN33haTssK3Libt6DITWW/a4=; b=DKof8m1vHIoWqK
	yX6Ypzjaj7XKwtVC+npgKl/6ZkIDuGknLK71Wkw+igR2+vyVZjvZdFUL/TU8DdU5j61VarMTc89tM
	RP3L753zoOoViaBI4zSgz+zg2RzrckGQjMLTRt45Aq2tGQlFV/5RBY5m4dmAAhtt96szwl+WrJFmr
	KW8r1lDrnQWkwKShtVXa6RcSPVrkyVIHqIGOLTzoLniLHWZ7rapVYR5y4I+ZGncYoQZO9yEaXbXS5
	0p3dpUUswmqyiSaNly/uems1vQGSd5xjirBs9YqXlTJiAI4ERmUmfG0poD6YCrF0Dky45dgUFDq7i
	j3Jqv2XtLRl1Lh8agHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyXB-0000000EXrb-3Uby;
	Fri, 13 Nov 2026 21:10:09 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyWh-0000000EXWm-1t4z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:09:41 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-15ea896ddc8so1986544c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604178; x=1795208978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=na/fJsUdW+mes1yfquIAN33haTssK3Libt6DITWW/a4=;
        b=TtyDaimbwqYMHjH0BMMbxwenHYLBS39253PeTvWwDWAredjtmzadBOZN/91sfORTVR
         5wPgSiSet8nNsF84SEkKQXDA3N3T+RbL+ltsDmq8cA4MNtNmuzBEeNUgWa3Bx0440QJO
         uHBi8HNFJD40CWguwmvcvAKVLDnrSLD38EQgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604178; x=1795208978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=na/fJsUdW+mes1yfquIAN33haTssK3Libt6DITWW/a4=;
        b=2mYifdSzBsn0bnh6KQQb4VzHT3ryKLzE68yCN/hiyIqzljfmfyZdoIVw5wuVEg3fZp
         AciP5cu0ftOjWhAKtneM4FOWh+5uXxKKoeZEZ838YflROQJdAZqLaI8jKbcVYTOoGirB
         nbdDVcLeiB0YxgzKQrYbn5oP5FU+Kz/iQrNGUsTKJW/Kl/B73avKEBW5JmB/Mo5QXFoH
         KV42DEhKuglQOciJk/atXq5QRCP++I7pXbrSFoqAD8P2Czd77BApIP7Q239/9/xpNYiM
         2xnnk88hacv3EnpKtOUqF1qulgEoejXFFFEY0VixTXkHwxWE+E92N9GxJOYOSBA5GH4Y
         kktg==
X-Forwarded-Encrypted: i=1; AL+hErEU8QBK+33Nx2LU89hGquxsBMk0mXPnbtAj8Cu3ssAFXUEmd7I+yF3s+PUKLmrHolBGblhX89QqvNZNQL4wtBo8@lists.infradead.org
X-Gm-Message-State: APuU4Z/7a/gTfNIqYjiCocqP2eoEZ0gByDtYnlcOdlH7NVIk+WsQrQJk
	s3LpgNFrZOnHhoQmyn0qtQ679ZS850IswYW/p+mWN9vokr562mlQHoWR7cgdm0carg==
X-Gm-Gg: AYBFou2AQB8+kJoysxJ8pV++pnBAHllTTcD+XCq75pWkv3cPaOF8JkfCVgGhXBTgO7q
	FlFexxjvr86JPNyhcdL4sYcTEp1FsSsICfwUYRsd53wsy9mxLH+8lR0OsgF4WB/SKWdXHNCkH9b
	QZ8jBPDjpVWqX7LT6ZRtQcGZe7mcY7mjh16IQjxHzR57YnMYwEVTGQSvR3CehsrtyCPokXmxYQ6
	pQ11thPhvTsP9Bd0/E30QZ8KI6Lhe55qVSFa8zm1vEYmK0GEeMR0AmnFDuekbIq+qicFDoMrkI7
	F6eYl7BMCab5pkBGyv3zTt1Eo4HUdIE1/0OkeGnGaTQiFejopRrvN8iBS7pB5EAtTCxkuZHLtLZ
	BZxyaycnXWZsW/GRCb2OS59p7vUPx88c9GQt/nNVwx0Xr9nx/nt5UJ9yxE9FSnCPNSgG1GmqkUD
	EFUf8PbrfrHLADHgLT96P2wlqrOr4xjNYwwAuNtJBkjNCK0nTJXvaQgv6IiyjolPLlVrjaadQV1
	KKi9IwJ4Wh/pn/wpSFLt4qn1yEXIEh+32mEyMxA8eXfUszOz2xTCY/zrhdUxVNhQBkijexMiZvh
	s2qnJLwoBM5GLFh1mxQUb+dwq/tk8/XukFYOLu6+X5vTm28bytq945UyWg3C5cx174AA+YpZZtF
	/XyaMoEMJttoh
X-Received: by 2002:a05:7022:1701:b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b5030ee9b7mr3024887c88.40.1794604178303;
        Fri, 13 Nov 2026 13:09:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:36 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rong Xu <xur@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [RFC PATCH v2 3/5] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
Date: Fri, 13 Nov 2026 13:09:12 -0800
Message-ID: <20261113130858.RFC.v2.3.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130939_518377_D3198764 
X-CRM114-Status: GOOD (  23.80  )
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When packaging many board DTBs from the same SoC family into a FIT
image, full per-board `.dtb` blobs duplicate the vast majority of the
SoC and board-family device tree across every FDT node in `/images`.
Because each FDT blob in a FIT image is compressed independently,
standard per-node compression cannot deduplicate those repeated common
nodes across boards. Factoring the common nodes into a shared base DTB
and small per-board `.dtbo` overlays yields substantial space savings
(for example, reducing the 47 LZ4-compressed `sc7180-trogdor` DTBs from
1.71 MB to 213 KB, an 87.5% reduction). In addition, some bootloaders
(such as the Pixel 10 bootloader) specifically require a shared base DTB
plus per-board `.dtbo` overlays rather than monolithic per-board DTBs.

Add opt-in support for factoring the DTBs inside a compiled FIT image
into shared base DTBs and per-board overlays using `fdtfactor` (from the
upstream `dtc` project [1]) when `FIT_FACTOR_DTBS=1` is passed to make:

- When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
  included in the FIT image so they retain `/__symbols__` and
  `/__local_fixups__` metadata needed for factoring.
- Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -F $@` (with `FDTFACTOR_ARGS`
  defaulting to `--strip-local-fixups`) at the end of `cmd_fit` when
  `FIT_FACTOR_DTBS` is set. `fdtfactor` transparently handles both
  uncompressed and compressed (e.g. `gzip`, `lz4`, `xz`) FDT image nodes
  inside the FIT.

Because `fdtfactor` is a Python tool that depends on `pylibfdt` (similar
to `scripts/make_fit.py` itself) and Kbuild does not build `pylibfdt`
from `scripts/dtc/`, `fdtfactor` (along with a matching `pylibfdt`) is
an optional external host dependency documented in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst`.

[1] https://lore.kernel.org/r/20261101220224.1436242-1-dianders@chromium.org

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch obviously could only land if some form of the `fdtfactor`
series [1] lands in upstream `dtc`. While `fdtfactor` itself will remain
an external host dependency (since it relies on `pylibfdt`), we will
still want to sync the `libfdt` overlay `/__local_fixups__` changes from
that series into `scripts/dtc/libfdt/` before landing this patch so
composite DTBs built by Kbuild with `fdtoverlay` retain full
`/__local_fixups__` metadata.

If people hate this patch, we could certainly just run `fdtfactor`
after the kernel build finishes.

Changes in v2:
- Update fdtfactor invocation for v2+ flags (-v -> -s, -f -> -F)
- Expand commit message and notes to explain why FIT_FACTOR_DTBS is
  needed, that fdtfactor is an external host dependency, and that
  compressed DTBs in the FIT are supported (Simon Glass)
- Document the optional fdtfactor dependency and FIT_FACTOR_DTBS /
  FDTFACTOR / FDTFACTOR_ARGS in Documentation/process/changes.rst,
  Documentation/kbuild/kbuild.rst, and arm64 'make help' (Simon Glass)

 Documentation/kbuild/kbuild.rst   | 14 ++++++++++++++
 Documentation/process/changes.rst | 10 ++++++++++
 arch/arm64/Makefile               |  2 +-
 scripts/Makefile.dtbs             |  8 ++++++++
 scripts/Makefile.lib              |  7 ++++++-
 5 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 80cac4c432e4..4271883bc10e 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -383,3 +383,17 @@ Path to a ``.fitconfig`` configuration file (relative to ``$(srctree)`` or
 ``arch/$(SRCARCH)/boot/dts/``) selecting which DTBs to build and include in
 ``image.fit`` and optionally setting properties or subnodes on each
 ``/configurations/conf-N`` node.
+
+FIT_FACTOR_DTBS
+---------------
+If set to a non-empty value when building ``image.fit``, compile the included
+DTBs with ``-@ -L`` and run ``fdtfactor`` to factor common device tree nodes
+into shared base DTBs and per-board ``.dtbo`` overlays inside the FIT.
+Requires the external ``fdtfactor`` tool (and ``pylibfdt``) from the upstream
+``dtc`` project.
+
+FDTFACTOR, FDTFACTOR_ARGS
+-------------------------
+The ``fdtfactor`` program and extra arguments used when ``FIT_FACTOR_DTBS`` is
+set. ``FDTFACTOR`` defaults to ``fdtfactor`` and ``FDTFACTOR_ARGS`` defaults
+to ``--strip-local-fixups``.
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 28f2ca63318e..f9b2a35ddc45 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -201,6 +201,16 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
 built from the U-Boot source code. See the instructions at
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+fdtfactor (optional)
+--------------------
+
+This tool (along with ``pylibfdt`` from the same ``dtc`` release) is used when
+building a Flat Image Tree (FIT) with ``FIT_FACTOR_DTBS=1`` to factor common
+device tree nodes across boards into shared base DTBs and per-board overlays;
+see ``FIT_FACTOR_DTBS`` in Documentation/kbuild/kbuild.rst. It is part of the
+upstream ``dtc`` project at
+https://git.kernel.org/pub/scm/utils/dtc/dtc.git
+
 GNU AWK
 -------
 
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b4982e94f80a..f12f4f7c6a02 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -224,7 +224,7 @@ define archhelp
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
   echo  '                  Configured by FIT_COMPRESSION, FIT_DECOMPOSE_DTBS,'
-  echo  '                  and FIT_CONFIG'
+  echo  '                  FIT_CONFIG, FIT_FACTOR_DTBS, and FDTFACTOR_ARGS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index cc14fc905ea3..bc0c62617a7c 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -126,6 +126,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
              -Wunique_unit_address
 endif
 
+# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
+# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
+ifneq ($(FIT_FACTOR_DTBS),)
+ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
+DTC_FLAGS += -@ -L
+endif
+endif
+
 DTC_FLAGS += $(DTC_FLAGS_$(target-stem))
 
 # Set -@ if the target is a base DTB that overlay is applied onto
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e08e35d4ed74..af2d3e508424 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -418,6 +418,9 @@ quiet_cmd_uimage = UIMAGE  $@
 # ---------------------------------------------------------------------------
 
 MAKE_FIT := $(srctree)/scripts/make_fit.py
+# External fdtfactor tool from upstream dtc (requires matching pylibfdt)
+FDTFACTOR ?= fdtfactor
+FDTFACTOR_ARGS ?= --strip-local-fixups
 
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
@@ -428,7 +431,9 @@ quiet_cmd_fit = FIT     $@
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		$(if $(FIT_CONFIG_FILE),--config $(FIT_CONFIG_FILE)) \
-		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
+		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^) \
+		$(if $(FIT_FACTOR_DTBS),&& $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-s) -F $@)
 
 # If FIT_CONFIG is specified on the command line (either relative to $(srctree)
 # or relative to arch/$(SRCARCH)/boot/dts/), locate that file and extract the
-- 
2.56.0.611.g1030f0b940-goog


