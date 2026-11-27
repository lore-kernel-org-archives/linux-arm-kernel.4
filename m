Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36940606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XuETBG5H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U97Qs2py
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=swXU89ZgE1T0CWgfhGQJ4/y3KO2SK49/UPOsKrkU4XA=; b=XuETBG5Hf0LHfW9o8ft6qU5gnz
	OTMGLHGzfZTji+3JcYU4st4SnxPZ19xJSDE+o763Tu13Htr1r7k1d3idSiDv7ps8ytQRwwIklP0D/
	ym9/P4fDBC4o1MOMIvxH6wOOURmdiFm4ioZ2exPtneTjTC3ly/cUsrlgXOTbY8Qz+vzs6palWdpdP
	izR0w5OWEKxO1LCF36gAMs1+tcE1vucsdLYGjmoPhOwZTSDnIeHP5SdMOLEeFGBB+/15iZYv8TRW/
	pPVS0SosTif99da/eS+swh5/HZcKlPMaU1PjiEnEurGcI1vwqJR1QP4EkwE1j05Qzl04ySGRR5bcV
	IzmYD0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpbs-0000000F3F8-2U9z;
	Fri, 27 Nov 2026 06:39:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpbj-0000000F3Cb-1qJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:38:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E2041337;
	Fri, 27 Nov 2026 06:38:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761534;
	b=sjHzshTknVKaTfN3k5BiOtOW//5wo63w0HGEgXTpmefGA7lwRYMgnbW2sng/MwigmfCM
	 QaHHF4EauHqaB9+mGBmirCgZJtgfVExdXxERwG36uozFowRgz487ytRNc1H3gaQGvix3y
	 mMhuNhK2e5jkyp9/y6lXjUE53HZ1AdqvdT4fPl2NLWXh1Zqadi8V8vnJCnWzlbDhYZB72
	 TOe1i+avyZhqiFeWC9v+LEbfWReqW64dtZfLIuGF35zcgI+l1myD21hh367e6qOBeoGsP
	 PAz3r9lsHZk7DbPSD79gLmGwzyz7+CZsjeLWYDbWQh0/WwAq4E30z9MHGS6NJVnKvvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761534;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=swXU89ZgE1T0CWgfhGQJ4/y3KO2SK49/UPOsKrkU4XA=;
	b=H3RDAvgw/lFTlYoImzvmxPUkD7xeOT6YKuMoslgx91ZPki5tq7RWPzF1+Mmb55GiOXBG
	 RxA+Vv10dv2lHDVnbN5RCtaQRIQpQP6TBjsRSRkmSEZumJw1g7EKP85vFpSubkk3dId4F
	 5ui4TwHKZ81pcZN50rCekyv/7joQ4CziqBr3w2xI+a8cLcB7hvjjdtfr1QCkHye1jALyH
	 /CJfqZNFDUMp+sxkEcJRRDPevu8B1gjdLFYL9rVLEiTmM2efawllFIJg6SZdufnocwX8t
	 qL+dBthCr0LPBMVuZlBHvgRtsYbtCgOzz4Wdb04A1dishDQqDCqBgP4lqyDGRhJiDnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CDD21F00898;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761534;
	bh=swXU89ZgE1T0CWgfhGQJ4/y3KO2SK49/UPOsKrkU4XA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U97Qs2pyeCuR+F0jRJAfYbROzzNoOJNnU9VgsKdANgQYWwyUra6zkdhJ+hbRUVspf
	 32r6RPMmFIrrEJlNYTGE13Y03AmifI7npRC0F6Azk3w3hPX/u93AOp/7YkG39UU63q
	 fJDTTMLS5/z99gOjePoFPyihSZMXhAWwk3LY0shAhLqUjyPZ2DkJZ9S2oTQbK6EtR0
	 LjP7jMHyOL4ebL2/CxHVeXrtAO3u021feeAu1TiQbXQNwOrs8+XRamDPbEiTyBTOrm
	 82PZDmroSLNEU+/fdVZK+jTEhjBpVZFQ8FlMrnX9D14/vTc1xK9u5P/yLU+CoFy8x2
	 Q56ZKk5+Kd7Lw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F2B674B5B4;
	Fri, 27 Nov 2026 06:38:45 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:38 +0200
Subject: [PATCH RFC 01/10] Documentation: coresight: cpu-debug: Fix the
 module parameter name
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-1-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=tdkUlwej4U5iLMdBPWEh+RWe3oS9OYaUeonOCJ3l0xI=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqgXMe7kLxNqEDh488fXZ4aTVtU1rNjzgzmiv/RYz/
 5P8cu3ZHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiSqsY/vtP3ZcafkX8Xciv
 0mdPOv42OHg5yt1XvVByRK0re8U1Hm2Gf4bMJ1VZYpJ/zHXg/hPZfyCqqrzFM/Twzrlzd0b6OXz
 nZgIA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The parameter that enables the debugging is "enable"; the module has no
"debug" parameter.

Fixes: 0cd555c35131 ("doc: Add documentation for Coresight CPU debug")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 Documentation/trace/coresight/coresight-cpu-debug.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
index 836b35532667..32fbae244524 100644
--- a/Documentation/trace/coresight/coresight-cpu-debug.rst
+++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
@@ -130,7 +130,7 @@ If you want to enable debugging functionality at boot time, you can add
 The driver also can work as module, so can enable the debugging when insmod
 module::
 
-  # insmod coresight_cpu_debug.ko debug=1
+  # insmod coresight_cpu_debug.ko enable=1
 
 When boot time or insmod module you have not enabled the debugging, the driver
 uses the debugfs file system to provide a knob to dynamically enable or disable

-- 
2.43.0



