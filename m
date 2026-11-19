Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D230F606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W+c3m4k3;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XIpGOD5C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o51PHHimL+ClplpmBAEFYhIc3zL6vyqqxZiEgSq/9kk=; b=W+c3m4k3GtywMa
	C7SrmtCDAz/PoSqVh9Q2tLkPpufAWTTuU0baw4XM6n4kx2xvesQYybpLbUj2EN2D7ClYTR54oAlak
	N49+pi8yWsQI+eVwpyb4SVeRGzPEcQePlgUYJTvjf1H5ix3n69yBzLvgmYn8XUFyR5PfmOHAkpoV3
	mr9SHXvPmCwFw9tqo1IPEGOqPqioVTpB/fV9JJBNjKoZ0B5StuXBne9ptzIGM4NpomNzev2z6Dnx1
	en8X3FTB4Tlri3QqVbmwomwOQKHG02U7IhZjOgXy6dydFUJp0cjGBWZ3flLWBa/M782v+cphxXEA5
	TNEt2JM3e6nq04ckCqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1oK-0000000By2d-0oeu;
	Thu, 19 Nov 2026 13:04:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nW-0000000BxJ9-44jC;
	Thu, 19 Nov 2026 13:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795093403;
	bh=DuZYc41EIsQ5vPMM6JdUB8Ec678Rzhjvat9GBAzov9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XIpGOD5Cb5DjAA0ZabLiCv4ze3DgfMbJ2tpi4cFUqy03v2vs2HZqV9QyUpPFI9Ozu
	 nk8cg0TGMBP6VSX4rNsgUEAYf926lCNoaG7eygVm5W/otrQAZSB+yM63Qrz9duHfaN
	 g75Y+9phEsS6DodXEjmDPaaGPsz1gT5WL5klYvoJrQYvDyth37+hNkcMZKL20wfPB6
	 PHf9d3YDbNrn7zlKQuCG1LH97VDYRpQK6S1nHO/utaSO4sVrjA3t+Ez/HRRbcd96dy
	 Fv/Zot3cv6/GgxZn0XTEY97oM89kFbV93dfbKPbFxoCykLOW2w6raxC3YfL/VgMf0b
	 qmhkhM+zrCYSg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3412717E0E2B;
	Thu, 19 Nov 2026 14:03:23 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 985A448003A; Thu, 19 Nov 2026 14:03:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 14:01:56 +0100
Subject: [PATCH v4 06/11] PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf
 capability
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-6-517a68c008fe@collabora.com>
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=j987KwOe/JwubEnKA3HJbVtRAe1zsvHFfLC9STd9j4Y=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr+85ptH5AWkEo8lZYozCO9+Jb5WpveWXhkK
 BBXUPKUWzznvokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/vOaAAoJENju1/PI
 O/qahvwP/i0XIXshc8SFU0WKh64gHr7vP4+pamtVG8csttzBGw3zWm0ftVSzzrxbHyYDBoN/ZPK
 sc/B2ARTjXDPKNvhr7N5Qjawit8FxLKD0Ku7ynDVCEKCWVfBolhuf7LxuzlAmXplWkHt5AqVdZT
 NaW21sNx8oyh3xl2WZHtaRWafgqrgH1V4hJ7sdbLWku0iyn+n7gm0PBzbEwINd80ZW+lIIxT/SM
 H+bPkUuXJ6AsHQZgXdIyaZZMDm20hdhpuWSCTfeF2yVz9K2/IfJULC3pcrz3XUCLosQQOftLvtC
 RAinGD/KBYByD41ty2CwqVUFud6Qwl/xrL9sIp8OCM+5Z3mODQ4KF6A4PEhj9rCzYA9fATa2dY0
 6WMueaWwM0/QQyN/qDl5m87KIlfkcQkg4xdgaFGQj5BX4424A9Pzi7Gw8MNYr5yzJMj+/WTx9Pi
 mtVgSSb1joOZN1u3Q4/N72coYK2A8ZqvL1IxY8F6d0M+UYE/FcJYOqhzI3fATrXHjfOn+6ZIKBy
 Z3ehvwJozWJsV15OJpcmxqE7RxGlfJ1ANBYr1tEJ0yj1cUiGWrWNywdoROSfO4MaYNvFjsvTvCD
 xqmVB9Bmahk1d6mmJ7pPxI06jB383v0RTt1y43Y7H5i1wwwGfSNn6o3vQeZPq/C1SLE8jPwmPsA
 YMYrWjxLEl67yA8niMRonGw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050331_289377_9D877B79 
X-CRM114-Status: GOOD (  18.98  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The perf subsystem's PERF_PMU_CAP_NO_INTERRUPT is a bit of a
misnomer.[1] Instead of meaning that the PMU has no interrupt, it
actually means that the PMU does not support sampling. On CPU PMUs, this
is equivalent to not having an interrupt, but for uncore PMUs like the
rockchip-dfi PMU is, no meaningful sample data could ever be generated
regardless of whether or not there is an interrupt, as it is not a CPU.

Since rockchip-dfi doesn't seem to make use of the interrupt the DT
provides it with anyway, this was probably never a confusion that
existed in this case; the capability flag was likely just forgotten.

Add PERF_PMU_CAP_NO_INTERRUPT to the set flags for the pmu struct's
capabilities member, so that the perf core knows about this limitation.

Fixes: 4d586b5724d3 ("PM / devfreq: rockchip-dfi: Add perf support")
Link: https://lore.kernel.org/all/20250619140442.GH1613376@noisy.programming.kicks-ass.net/ [1]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 0cdeb59e6d1b..43da602ef101 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -648,7 +648,7 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
 	seqlock_init(&dfi->count_seqlock);
 
 	pmu->module = THIS_MODULE;
-	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE;
+	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT;
 	pmu->task_ctx_nr = perf_invalid_context;
 	pmu->attr_groups = attr_groups;
 	pmu->event_init  = rockchip_ddr_perf_event_init;

-- 
2.53.0


