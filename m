Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B8606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WIYkIF5M;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W3YALd9K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=; b=WIYkIF5MWd360Z
	eRJ36EnSfpCo0Q26UH5WrqH1+1v23C2S23fMnb3i6zHvhd7XgpayloipJRwTMGmeYmimFjk0HvLvz
	t4tuhOjqIfV1LPyKIKDSIegJ0R6XKg3ozMHOfgQH0Gy500UfR29Ee8yvM4BA5hA5pHb47eZB2S+Rh
	wWlFgwX8D1WDSqpJ/WqiJtfHf4teXGmlwQW1fRI0nFfv9qfN00qZLK0NZWK6W9TW5CfAP37JXfQ94
	hKfcUvQxC47DjPOhNShRaGEsAI/tEJl+KLzvKHnu8LfVoXDo+q/FJ+THPKe5lgVMmWJPWpd0MXP/P
	nDbIyqlWyk4l9bdlZuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyXB-0000000EXqT-1uxZ;
	Fri, 13 Nov 2026 21:10:09 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyWY-0000000EXRs-3UpV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:09:32 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-170135e43c7so1745138c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604170; x=1795208970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=W3YALd9K9ghY8uC/j5meTuxaV0QFGl2UXhf9uF7H2Dkq8XxN7ovV8kW2Q5CtiMtrq4
         m0ZaCygZWo3TFjHGBzrJKeGMzFgKJpP3//qAuMrC/DM3jYRfVFf8RVtaBM2dVvZ/rAtF
         L5PeCGslkbt20IFR2Iov19Qpp+8QnKd60jBSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604170; x=1795208970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=QWRscktX3SPm1Uw+RWFQmwPtKbq+QGQslOgVgm2T0Y4orjnTA+G9UzmLgPjHZjMK0n
         sBG1iiCYrQeiQkCpY95wMd+e+14YSAOWDr6JFyhsVYRrV0GlSRpT8joWbqoLBZo0eF/q
         AVVmvnDFNorq+m1TNZz5v5VgxnsyW06LDDl48cWbfZi4qgLSBLlh5eR0RqPooT3TAP81
         olvbYomjBNIIbvWi4mN5W91Y33ysXOUF6dG1F7bQx6yqoE6yYpZOHzji3L31/zEic/Ss
         NO2JVTV3NZ8NzkTZWOgo6L5381LobE+Pys3kBNQxdJYebrc9xPR61hokSiExygHPfkps
         yB/g==
X-Forwarded-Encrypted: i=1; AL+hErEqv89K/qcR45ZGbVW3AmPBfKdjIWnTJx0vLvnchOpho32j8yAjRf+e7vkmqLh01RZCZveKhj18yH7xaJUr+5Pl@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZdcniYEImf0BNq3bK56jVGpv2YzgX68urQYRwbp19j4nC+4Pt
	KssG6uAA6Y8mwccn5FpCgNCLnP1D+UxuO1lVKa2LTcw6Uh5e3b81oSF1hgWIZ4HPew==
X-Gm-Gg: AYBFou20vsfOs3w25FsrNcqT25G3z6xhnCqx9Su7wtwWBV+Gv5ve+48CLAjo567HVTT
	fA9OlT27W9O/vN9F9oyQiYzsOz62l4GC3u51XbAXNxJVWUsjy+JZ55E8cI5Q2goqBU1K/cyLCak
	G5jDxe2aM2KOdWPoutVYqouzp6c7b6lh2VCl8OARR2MGI0eQvIXHWTnVt5HHCkNv62kQXvkm2zG
	6TE+4DxVT8DhW/epN6A8OrPRX54D4htGxZStrca8/kvea3LhwV79/ecjJ1kvzrjZnX7c8nWv0fV
	ec8gBZEntg6F9CvnTMwPekLbV3WaIAN4+7orx0pRBPvqJk024WsVoe5oIKRMwwTAFnfNbHyfPCt
	0eGguoXkFwEJEFYi9pX59D6YC55Y/RUabTuwYdwLKZvb7OMNkNtjshAu3zzJeaN8NwNBlWPBXjF
	fvg+Tx/nzg8FSDndCpcF7c71cJhgvTiUMqLoZIX3LcK+J6quJ17ciIKetZaLXTfhdoaaqjOpzSq
	6QoIzt2XS+dFMwWtWhr7Jx+mGKsIIYMBlcck5MA9XMo44BAM5FMdm5pEuPuceo362nb+1TaCnt9
	qEoKak5RwH4gUONtI+1dnaV+yehLF9wLeEQwAZ5s7gyoRpRTowMGiBU7n/d3Mb/CMaD2cTNlRD3
	LMxgFtGRcnpAa
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr3160476c88.46.1794604169766;
        Fri, 13 Nov 2026 13:09:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:27 -0800 (PST)
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
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 1/5] kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
Date: Fri, 13 Nov 2026 13:09:10 -0800
Message-ID: <20261113130858.RFC.v2.1.Ic9a4337a7740a76d78fb68d3763d36a35a3231a0@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130930_908993_A6A3AA9F 
X-CRM114-Status: GOOD (  13.70  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

`FIT_COMPRESSION` and `FIT_DECOMPOSE_DTBS` can be passed on the `make`
command line when building `image.fit` (see `cmd_fit` in
`scripts/Makefile.lib`), but neither variable was documented in
`Documentation/kbuild/kbuild.rst` or mentioned in
`arch/arm64/Makefile`'s `make help` output.

Document both variables before adding new FIT Kbuild variables.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)

 Documentation/kbuild/kbuild.rst | 12 ++++++++++++
 arch/arm64/Makefile             |  1 +
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index e71a692a559a..744a32ccbd1c 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -364,3 +364,15 @@ LLVM
 ----
 If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
 of GCC and GNU binutils to build the kernel.
+
+FIT_COMPRESSION
+---------------
+Compression algorithm used when packaging the kernel and device tree blobs
+into ``image.fit`` (for example, ``gzip``, ``lz4``, ``xz``, ``zstd``, or
+``none``). Defaults to ``gzip``.
+
+FIT_DECOMPOSE_DTBS
+------------------
+If set to a non-empty value when building ``image.fit``, decompose composite
+DTBs (built from a base ``.dtb`` plus ``.dtbo`` overlays) into their component
+blobs and deduplicate them in the FIT.
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index ed28f94be428..8818d6a2015b 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -223,6 +223,7 @@ define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
+  echo  '                  Configured by FIT_COMPRESSION and FIT_DECOMPOSE_DTBS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
-- 
2.56.0.611.g1030f0b940-goog


