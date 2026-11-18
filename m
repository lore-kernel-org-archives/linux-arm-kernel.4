Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9B60A263C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=klQJPpJe;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M3nT+NYQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wtMhJwiFYRL4oBCDekIESBHFFArV6HDfCX3FWyhzvOs=; b=klQJPpJeJWfBf9
	9A6CXVS+aO9opL7VwoX6QNTa7xSvKw/tr3jZFFGTur55bAUU0R5Lv9po/0mLjIcwQuK5wp8K+GQhy
	968YBm8buez0Rqz4sTl9xfNbD0e3bjJ6goRVfxwYJ6+aPMmYyDIcb9J4s7tE3a+7LvvuDsXOAHlOX
	11izW44xbN5vzgDCPQr08fziJbUue89rKvoRcMYgD4pHncyt8pn4CjKLYuL0iRqQjJr+6xjLC1RlE
	xfQ1i5tz0IP1tbDgwjPpWiZa1Zkamh+CU4s4vo2QWV5b3Ds5t/IOyAO8Vwcy4TB0Q0JJt/wcfsAMR
	xImtwBQZyLh0miTfCtaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXp-00000009U64-35Ts;
	Wed, 18 Nov 2026 16:30:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXg-00000009Tyd-399C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-492f0a1b685so840393f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019390; x=1795624190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtMhJwiFYRL4oBCDekIESBHFFArV6HDfCX3FWyhzvOs=;
        b=M3nT+NYQNC2kFuO+hN0WPSHJkdfvmpIctUedThgDU0fcIhufWn/XVmfp34DKYSJj0u
         kO2KvmYmZ8Jvgt9yHT//u71eqWq/QQk+IXTA5HHDoIJtMWuAO3ruLMRFkhMP+fMMwh7H
         m/j9F4AKRlwFR8+7r8jX2IJ0ovtDp97nFkNEpENjjhN41tIcaFxNfkjFX6oqlbZXrTz4
         QrFTA56dJ37hN7dIGtoE1MX5aeOEzjV/zW8/V2AOrr9NPr9TQiN7FjvAekom4jIZt/2o
         HI0IHM7PQN867Bv0yG4NrhritzPg85j2b1SfjtwxCdshd+gVv3pDS0xE4jrds8HcoDRg
         lNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019390; x=1795624190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtMhJwiFYRL4oBCDekIESBHFFArV6HDfCX3FWyhzvOs=;
        b=J1APqa3eb7+fw7YFX/wssTPLU5WgajCISZjvdnz2BWNyCOSQgEh/RJAuZVzjsC7XwS
         I4mBB68BO23O1ekH+2jgNF7Y/d9EyTy4UocagiYwsQjvL6NgXPIXZvA4JSExd4m6mbn0
         01taYW2NV9E9NMnX1OA8IZHbBC1fnAaYJjwwbGtcBWrecawt9GXSZ2k2uCCnjJHNhfTr
         AyRnfcloeyKIlyfB5a/RebXtU9D7qfTmrdqXfc85MCNKa9bjzMZugFznmb8SsK3gVz4V
         5kV/fYeWVxiCICykmh2Dc/RFTm+PEQUdOdEXjj+gq1lhVHOhUaFsTlNITnwtj2fPqRcA
         SOxg==
X-Forwarded-Encrypted: i=1; AL+hErG1fzj3ekjoK8OL5OeoOugPU3U3rHkdHuQEawxtVo8IdyqZNTj4DBzYtHiTiH7dwixUnFYYi+5ESZwfAUBO5hs1@lists.infradead.org
X-Gm-Message-State: APuU4Z/lgLBlBZi2PVYwvtvn8myzbBzxSQJ2jX1AsAzpDXTEXCpXSvWR
	MQURayIjj8fJnveNGuVU8zS3D24qi+e//LuZsrURupkcSxQXnRWUcXx0LhgFSkZAAHM=
X-Gm-Gg: AZFdTZcqh9/zL1Outx/Psv5aFSQK7rJoP1SZvoOChrfn3X7tru0vB2OmDpZEQXMAjkI
	FvrWEEH5buYsV9J2SLDgDanE6gPMFRFSlfB9CoXWyEdCXSPlA35o0/vv+WRNCvblxbLjWZ2dTIp
	pC+AEIMap7CNsU5oNq7HD3INfOxfognStA3LMSjxjy2PNHbSylptHwOrvTitJfIpGJX0r7vnf6B
	6h7AR33ZUhl2ng0mB6C5xhNXFe2zWgej6TafTWMJHZAgLEy1nWGmVWYHyFQ5yTIwJXFpnTMRqRF
	SKdp5RpdUWhOqGOcY/HaXAV+Twhodq+yoyxsMqPOKj/phMw+XI9PAN+b4ToAJiJ4flTg3P2nf01
	EqPaCMJxYOVDZ3c6PRg03vbcwt1kWLflxs5D6N1bVosia4ZNnj17HShr1cvQcrIo/hSgmcDGeIi
	DQBhx7dxi5Vfc5iTuxiVamG2/L3mXNRzpa1giCcLScsgVgpEgUTQ5d21MUESOX19tnXV4OYXuIy
	FzYFywEZVLYYw2PfMQhmWluwO6sNDIrV0iuMydClclUuD9xi9sWEdgPh17lFbFpiULPqTii7xrZ
	UCA46BMaqLnMLsm8HV6BRW2oaljcxko5
X-Received: by 2002:adf:e013:0:20b0:493:f3f2:2241 with SMTP id ffacd0b85a97d-4a63a1e0760mr4855589f8f.23.1795019389980;
        Wed, 18 Nov 2026 08:29:49 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:24 +0000
Subject: [PATCH 02/34] perf jit: Add name of clock in error message
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-2-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_082952_816664_0796FA3F 
X-CRM114-Status: GOOD (  14.03  )
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

Use the full name in the error message. This is also a valid form of -k
argument and says exactly what clock is needed rather than having to
work out how these numbers map to clock names.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/jitdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/jitdump.c b/tools/perf/util/jitdump.c
index 45a05316b3ca..4c1a71702f62 100644
--- a/tools/perf/util/jitdump.c
+++ b/tools/perf/util/jitdump.c
@@ -220,7 +220,7 @@ jit_open(struct jit_buf_desc *jd, const char *name)
 	 * validate event is using the correct clockid
 	 */
 	if (!jd->use_arch_timestamp && jit_validate_events(jd->session)) {
-		pr_err("error, jitted code must be sampled with perf record -k 1\n");
+		pr_err("error, jitted code must be sampled with perf record -k CLOCK_MONOTONIC\n");
 		goto error;
 	}
 

-- 
2.43.0


