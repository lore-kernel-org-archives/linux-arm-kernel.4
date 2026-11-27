Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF141606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L8taRCKL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqtupZcZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qdrFFlZr1wr6XK2UP+CUx9GD+axY9UPnNDp3yG1ITws=; b=L8taRCKLzYtYwR
	E4yLeIrdIiuOPiFXZM6KU6XB7yBi25CFLFqCdKm9ofAevDo5UioaNdLozNI/PptWm3LJEwH3abYrZ
	C7t81iRM18gRrOnsCQu8F4U63k5PwI0QzjcQANFUdU+ZrHbr7+hEM3x/MrzVVXjWDFHIKDV30lRiN
	Boe3Haz2bTZ5WGAY30fqxsJ4y7oJ0IrG08sr850PjtEV/oDcSNNcGzpXfxtx8XDoUS4qKGa3uDJwf
	X2OhyKf+YC54Fmr5tl0pn4PnN1mQ58YbLIwWvVftlC1HIcv0J2fNKSkC4unz1LlHpkiQwHp+fFCtF
	91HG73FsYYd98MJkuVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudg-0000000Fvze-13SV;
	Fri, 27 Nov 2026 12:01:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWudd-0000000FvyF-1vdr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so62455045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780871; x=1796385671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdrFFlZr1wr6XK2UP+CUx9GD+axY9UPnNDp3yG1ITws=;
        b=JqtupZcZwlcYvufe71tIMgueD4Va5sb2Qitnn8CJnZ0w7sVDza1A4fX+8z55PDS3Kj
         sqhBEQWh/o1fz3JOFlsktAMRpgpRyOrTNpPvEcZJfYNngQq51O43jYvprKy18wVfGQcq
         OPN8BeNko+MyMAwL26f0Iy18k4aOiOFdbV8Tmsj84Y1EHrjefuNVBtQzPuRYPx1AAieR
         eV8wMygiIg12Du/bxaX1Y61hTPagZmPD0BpjW/nwzsqA13btpgmqd0hoHCHegI7+tvQB
         9tDAWVVy3ju9bkA9U7zbZcMHlUQFnRpmFuIpWQHVsjdtP1+inYv+rwJsIApN4970dC4a
         SQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780871; x=1796385671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdrFFlZr1wr6XK2UP+CUx9GD+axY9UPnNDp3yG1ITws=;
        b=zZqkTHQsRHh0jyur56cUozB8iOkiy5NfQ+KjynJkKK7Y6JSJUkTzm/aZeQ1UC8Eqsi
         yrjkao5Rs5LcG0u9U0j3Zul6yxJj1hpSonnOTwcuAnlukAxrztU4B3ZO5rRQRXtQG+mQ
         dbA5m6L7kNBbgQmIKyH2jQ1Udy7J/SK9uZJ/8fuZ84RC1i7K1JAxlyuqAsW4ghuMgkbJ
         53/Ouh1vx4SNYl0q/agF9f57ORE1MkoMEIdj7PN+tIdspWMZrqmU59xcUrkhfNo06wG8
         gT8dUszob4xrInmJd/qyDKPFa/R1F6rpsZJkHMS+q4Pa7BRKPXk6Z8kU2fgevWauRYmT
         7trw==
X-Forwarded-Encrypted: i=1; AL+hErHL23CvdW+hTzt4I8+OIRWL3aX0Ao0GQ7oh4vYF87ruf08eFwInxwNd8N6BpQfJcCt2DEjS0QoDcfYQUi8G/iKj@lists.infradead.org
X-Gm-Message-State: APuU4Z+Hw2nY/N1O0j31C5r3qYuAh87Ptaxpu6V/NZiVvJuHvW+LIqVM
	VxD2N+stEt40Vv6hMRL3tQRRpWj+wNwV0VTYehw5pfSmE3VqLwHszFFp
X-Gm-Gg: AZFdTZdmubMG7w+ItImbrxX91r1brUwroYXhsNIwMwuvooaWPeNlfu2pD2EPwyJoh0/
	ddpuV/9WHO/cqIaf5FsVrXEtmX4JKV6qH8uGed1NZCWqCfEjCLYWYqxWHEDkayAVNtyumqOzku2
	fkKFFAM9hn/rd5T/h9XIibomufJ9E19gis2RtOLY22Uqa1ArkZEDjGUCUnKuGB3oe+qRgvwPD/j
	alFqLYzR+CXXfD2yXrJUOwCy0VE4sYrerSESEUnO2VLut7AKGfn0yPX1x6dYSWy8O00FA43uFOI
	YLWYltEWSHuR5c8aU/hbRtn8+69WIClrRRiZNTu0qAdMVTtJpfjnlwfnlpMuIFEcum7he7Z8nXG
	AiGcET+Czk3Zni7Iw5kMdHANYJ8agnd4zjSVY86Z99Vqp9eJAVvKYY4PvfE8wjFxYO6YDBwq81M
	8XMGNjFAHRK5KVmt7dkQWyMoX2d7vUn5kGrRpVNDxU0RYMdWtvazH6d1mRDmMxmwbD3HX4MWdwH
	QmIkcv+tYpfpNp9S6BmXVA5m12GQceGIQawUfgdID3wYIuaclFpIorfYEv9oQDmlLIbmaM/FXcj
	HZhSbLa+fV5wf7Bnu+Iy9ozfjr23AWtunC26Rym6MRr6A941
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr485415525e9.25.1795780871097;
        Fri, 27 Nov 2026 04:01:11 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:10 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 00/30] crypto: amlogic: add support for G12/AXG/A1/S4 and misc fixes
Date: Fri, 27 Nov 2026 13:00:33 +0100
Message-ID: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040113_525431_4486E180 
X-CRM114-Status: GOOD (  15.57  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is v14 of the Amlogic crypto driver series originally posted by
Alexey Romanov.  It rebases the series onto linux-next (next-20261123) and
adds, on top of the original patches, the fixes required for the current
tree and a few corrections raised during review.

The original 22 patches by Alexey Romanov are kept untouched (authorship
and Signed-off-by preserved).  On top of them:

  - the fixes that landed in the driver since v12 are preserved (IRQ
    handler return value and fallthrough, devm clock management, DMA SG
    unmap on the cipher error path, probe cleanup, devm_kmalloc_obj
    conversion);
  - three patches add what is needed for the current code (drop
    CRYPTO_ALG_ALLOCATES_MEMORY so dm-crypt can select the hardware engine,
    the ahash ->digest one-shot path, and a small cleanup);
  - five patches fix issues found in review: probe/registration error
    paths, key/IV and SHA setup descriptor lengths (plus a duplicated CBC
    IV copy), the redundant A1 platform data, the A1/S4 crypto clock, and
    the binding property order.

Testing on Khadas VIM3 (A311D / G12B), booted with a linux-next kernel
built from this series:
  - the crypto self-tests (known-answer tests) pass for ecb/cbc(aes) and
    sha1/224/256;
  - dm-crypt with aes-cbc-plain runs on top of cbc-aes-gxl and the
    driver's request counter accounts for the I/O.

Thanks,
Jose

Alexey Romanov (22):
  dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt
    lines
  dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
  crypto: amlogic - Don't hardcode IRQ count
  crypto: amlogic - Add platform data
  crypto: amlogic - Remove clock input
  crypto: amlogic - Add MMIO helpers
  crypto: amlogic - Move get_engine_number()
  crypto: amlogic - Drop status field from meson_flow
  crypto: amlogic - Move algs definition and cipher API to cipher.c
  crypto: amlogic - Cleanup defines
  crypto: amlogic - Process more than MAXDESCS descriptors
  crypto: amlogic - Avoid kzalloc in engine thread
  crypto: amlogic - Introduce hasher
  crypto: amlogic - Use fallback for 192-bit keys
  crypto: amlogic - Add support for G12-series
  crypto: amlogic - Add support for AXG-series
  crypto: amlogic - Add support for A1-series
  arm64: dts: amlogic: gxl: correct crypto node definition
  arm64: dts: amlogic: a1: add crypto node
  arm64: dts: amlogic: s4: add crypto node
  arm64: dts: amlogic: g12: add crypto node
  arm64: dts: amlogic: axg: add crypto node

Jose Nieto (8):
  crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
  crypto: amlogic: hasher: add one-shot digest path
  crypto: amlogic: drop unused field and stale includes
  dt-bindings: crypto: amlogic,gxl-crypto: keep standard property order
  crypto: amlogic: fix probe and algorithm registration error paths
  crypto: amlogic: fix setup descriptor lengths and CBC IV copy
  crypto: amlogic: drop redundant A1 platform data
  arm64: dts: amlogic: use the system clock for A1/S4 crypto

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  38 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   8 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   7 +
 drivers/crypto/amlogic/Makefile               |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 596 ++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 279 ++++----
 drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 511 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 120 +++-
 11 files changed, 1201 insertions(+), 380 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.47.3


