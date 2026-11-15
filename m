Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mV0ugqKn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPjhoj6x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=; b=mV0ugqKnJyQvY1
	MmHVXxQDYzolqGy9bu9hLkx3suGVimo0x4kUoNbkj8Dd3OXdiQ5pv+ILH4nZIeZDygkBbhafCpEiN
	sEXMhx1ybp+IpF2F7unPbkVDGjDsmLps+4KR3oHYqJeF0klJAo8j9uXGS2eyOj00VkkZEorZnOtfG
	HnCr/h71jFKhvY8gW3WQ4k9GjxukZxcMFENpy3Bqjlzbai1HIBOnsGhYooY9lwXVY0kzyK776ofMw
	gho0umkDQa3mduNu2liz+/5mSRf0Y601h99M+RRhoX1wzkOVhq5JIeASln83H9bMU8hkDj8X+N8f8
	Bp1ghjiV7+hT2SIhtwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBm-0000000HYSs-2cHv;
	Sun, 15 Nov 2026 13:22:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBf-0000000HYQD-1XwK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 13:22:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-491846221ffso2322908f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748945; x=1795353745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=vPjhoj6x4nm+tJwbI00wRyWk8g9aewsMcDkeIf5WkDAWwbIWObRmlVM5DXR9ec89X2
         /RCcLjP4uic5W5fOokMbNZ6cHVqxUPnVP6l71VPY25ZjOJ4EXvDc6s4OB3Xo7IyA0ss1
         aOos478Yg5atCqmWvuNmTKtUm2u3qlo4zKBM0Gv20kvnQCIDZMssk0zgwFw36ZMb7uwr
         h5bIIETikfH3+qoLfTW0A2MHktoxDA0B2l/sCsh8QUJDJL6Cd5uA9L1DmHVh+Aj+yttl
         3IVW14KtqtsNvC9+hj9QoiGVtCMMYx4CN60aiTrO2tevyzocKHecRxSLLEBxSiAamrr5
         34CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748945; x=1795353745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=DB9uL/aPjiK6j0tSoGVpTY8BQnc4HcvhyuG3e6o7Ft3gaBwppzKgmPeffvow2HTV1d
         QX5w8aGUgWd7W5nnOFLl9LB3yWGL48Krk7nHYakdfGQgMyfOnEURwF+tyAz2WHFyvl/b
         PNwteR6AM+OpUoTdeTCJX9pt6BISMujuitPFWzrKY8D0y5ohZbyyo6tMVIRCfoatQ7WG
         DCiRtwfXsvUOr+Cu/n0/ZeZo9t36Hru9H7vFFx1+L6iP8Zlsb0yA0X7S/w6P9HZVHVCB
         ECiSpy3GzBupoG/QOKMGpANvEyzHvM7Y59gyic82x5UjFDap/Mpl1RY5w2AxPF8pURuE
         yAAg==
X-Forwarded-Encrypted: i=1; AL+hErE0+c4F+zoci3SgT46T+yt5vP+IPmgDiSENWB7BM54MolGKL5UGahw5b5iMhwascc0P2/J+EYdU0SXvJDKN289u@lists.infradead.org
X-Gm-Message-State: APuU4Z8d4fZreeZ/f6Jhu9hQkFK10cn4pFX9Wm995/jUd6tp/YX2VDk8
	PIW06ZtM0dJXwQzW1KVWIarRJhMAEWtqYkektJ2Lm6zaIZHHZk0IBo2+vcs249LV
X-Gm-Gg: AYBFou0H/uBrqH3OQiClVbBQ9BkCFX144X9CQELyFAWWptmLj1MpbzkVJ/0ZdGtHAm4
	zDxDp2Te9PwKyBl/B94yIrzoWINqSz726cdnLZLrsVkwKdAXEurg2zblFojarB+7vRTjUlG6ZID
	0YuCQx51YtD/F0jhbrXp/IFWdqw9PAneTsM64xjWSw/FEaONeifWKgMkleye5POZR136SDGJmvM
	3MbFLQUv4Ht8FQTdVNGUAsyzQc2/TlhkAMVOE2TGhrIDbdX+tzXZt017mOIgawQwiXSFTsaG7y1
	Y4sz0vOM9UDzM17O6gMf/OQYHaF3a6Y6809PwEGcueqyEDqSlgEGBvhpsst61xs/85mPZZkDw5q
	CikeqZdXhS/M8YC/POAOhenzgDZ/01uqyDQ3m19onUe1yhnkM1iurW6SVDgmXWWj7bL9QWBziea
	IJ0Pzr4yHsnqyG+GJhZbPHcDhGB87WWPUeOSI1tnUgcV1elzg7Le/q1R33ujUAvqhhPWctr4umo
	7gcBUV31dRBorBoErOXxAgixa79Y16dk34s/4aYM17ynKEVsRFFkfCD+dQRWuXnqrBM6qvRdRUn
	Esi/UDD9fgEXqzgi57PoBGritUFTF3Lai+cnKVdOgkPe6vGbwktfnm0CYdG47OFinsCSZNKOXWo
	SXJvDqGzC+jG8j5EGoiGEU2KWLThgSMfFpYogadeBAV1ixQlHZUyvzWqISe9yaq6DgSWuH6iEeY
	egzSCahKir5UQqoVlBL+JRM31kWI4VwhKPJ3vLBx2nEh6X7CYmapNBlc4zhiwNgCMAziYFuLjH+
	6DFEpRwfynslAzn/f2EetNnLgXcg5E59i0=
X-Received: by 2002:a05:6000:2385:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-49c6a645dd4mr18844055f8f.0.1794748945187;
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Sun, 15 Nov 2026 14:22:13 +0100
Message-ID: <20261115132215.289236-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_052227_448461_93BB7D44 
X-CRM114-Status: GOOD (  12.78  )
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

Only the Beelink GS1 and TaiQiCat A01 include the H6 GPU OPP table, so
the GPU on all other H6 boards runs at a fixed clock rate. Include it on
the remaining boards, so devfreq can scale the GPU clock for either
better performance or lower power consumption.

The table also works with a fixed GPU supply, as on Tanix boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..ce82aa265cfd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index cbe88ee6a487..40c5c42b347e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f4a5a2215ea2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..f08077175549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.43.0


