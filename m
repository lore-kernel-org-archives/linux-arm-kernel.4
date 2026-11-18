Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C160A2608
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UXjCHJh6;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k11pVwgw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Babeb2HFdoGfJcLZPBXE1y9vKgkFHl2HkzCwc6W1yGQ=; b=UXjCHJh6bcOxV2
	/CBRf3kp6/RHbl+kJpKu8VnS07dE2Kh/Mwxamli/eJ07PRSg88kfSj3RIpyQNm3NISrb4GnWC0Fi3
	9s/ispPF98nEf7H3vHXhBu1S5tfAsI8sqKOoWVvZYzd4Bs4kSOiAD0LxUyy9s8itxe0RrGnsNk+3s
	7LBT5eg9RmhqociQbFytDQtCfei++30kprZqkGDdUJ5WgM9VEbpaS1SqC0UZ7AfjBd9aQHUrb40Iq
	DEn+JY4hTxAYl/bL3j6VpzzW4XgPcoQfkXMIhUTx2X+ToOl2ql4t0mqJ+JNprqo2CSFnBj/C00KC1
	xHXRoMTJGY7omiqDlVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXq-00000009U8r-3YAh;
	Wed, 18 Nov 2026 16:30:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXk-00000009U0b-3Qgq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b467581b98so14607975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019394; x=1795624194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Babeb2HFdoGfJcLZPBXE1y9vKgkFHl2HkzCwc6W1yGQ=;
        b=k11pVwgw6rXZku6sIefl6tVaiMbWqLpa3jfH1URpiYFkPpgJT/iU+J4OUQK2/fLdTc
         yVZypL/LPFzYak5VCzpG8Aayzzb2K4A0FHk5ak2Rxc9Twa7KuvrTmb4yQCMWaGpeLBEA
         Va0SJcEw1LClcoLIGWuqQOLag4LpKs4HYUBFjqiUd5XFCdY8Dm0SgRDrst6Ma3xbcjol
         7hUvIgCRKTKB6jAq6LSlT+MTrp001FItiEs/gkhrS7Y19+1DxSq80mCxC5gUY04XRff5
         rI6qBIoo65dsPfzbD9KXcsi6JWEEEHs2nhTXxzUSAEVfliJVxMDnbJtoHGEbagTFnKee
         o1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019394; x=1795624194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Babeb2HFdoGfJcLZPBXE1y9vKgkFHl2HkzCwc6W1yGQ=;
        b=t2HxqOugLShUgVUZlHuoP3UekdQ/OdX9WhFSUvhGldv+7aTY4smqv6pxqhqrSQhzFl
         NJPf0WxouMnI8j8PmGGWskgMLQWPkAH6ViRs1R0cv60FWEasDv917OIjwBqjlX7D1Zjw
         pYLdME7wiJkzAC03yJSh7eb/MATA6sOgzF4WbE43MIx6k8d1D2mibqCaEMkJWyMua+TY
         G2s7QJCzfRr4HpepGyTSfBbKfvf1yUe9AxfWvMjDdPuTSR0ARZ1UpAgnrw6m1fOKfMKK
         UrthYo5Lm8LrkfSp70foMAD4o2z7uOOZtY19JHV7hkyGWiG3iCsm2TCaZfThq46dam4E
         TM9Q==
X-Forwarded-Encrypted: i=1; AL+hErHt866v85o0yTRgfON4L5hCrDAwz7OggSn+mU/ft3BavMANaCCm8K62YILSbd2G9Q8PDNVrSgkgogVzDWwG6K67@lists.infradead.org
X-Gm-Message-State: APuU4Z/wAV+B0wk91WLhvlY3ea+7CiqXKqV0VM3fz3i/z9HlJ+5zSvT/
	vYXd0GWrqDcPThc96GMdXozAvgCIcsgUYUwhA1kAabMaPbFxekOfZquTl7RdFZFoBVU=
X-Gm-Gg: AYBFou2BvMpINenrzbcdosJYKOqX69mldGdYBjsAiAtjznqxzQOQqmwbvrj7bhgyQZN
	3mcK1zRldo0vncOxZPTSQV/ml5Quxu+MmgiLZSwTmFCAAS9r9w73jLrlVCUPg9G7tBGG64BSYXF
	QJtQ6DlaWr9bILmMovLdhOZtyJ3o0gQRHVVekhC+QRw1SlxLBttkBT87b/ulFh5yxJz1XA05AGD
	GteQiTb77HHgc0FCpLyPkLGdfzlCgWzKZpRudxPcFm/ZwKGHJPyRlu/RcsN56q5pq/WkvCZbSS/
	vWLKg60j1uUGXVVZBapBDnAfu0e1Sq9lDJrV6bbU4TCKa7D0QhB2ZI5LSiZEz2a147dGvHV5AGU
	rzXYUhhlCb/gk7Q9ObBXwwaUYqDsqXbXmqyNuAL5Jo0g9RIfCE5HKRtCPiNs5SBtoURIZpt9S7w
	OI6xylnkhCUyy/FEaF0PELCVXTvQ+zl56i7NGiGWlLNtrWgDuiAvTIXCzdcUFhWinaWuWbV/HuL
	bsI1Ba92CrY0eNl3tzvdVQPbS7ys3Jp3TggQ5DCCPOaWG4L72icZ4xZKb/812oohVhhHIsfXDp/
	G5mk6HBsEa9WaP5EdQ2LH0jTQ1tMURPg
X-Received: by 2002:a05:600c:8b34:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb7d6cd404mr58751415e9.1.1795019394229;
        Wed, 18 Nov 2026 08:29:54 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:28 +0000
Subject: [PATCH 06/34] perf cs-etm: Don't read past the end of the map
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-6-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_082956_901715_C1FFCF4A 
X-CRM114-Status: GOOD (  15.31  )
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

OpenCSD caches instruction memory one page size at a time. Perf reads
this requested size from the file on disk without limiting it to the end
of the map, so the page can contain ELF metadata from the file that
wasn't mapped. If a subsequent read for a different .so file falls into
this range, then it won't be decoded properly.

Fix it by clamping the read size to the end of the map. Now when OpenCSD
requests an address outside of that range, Perf will load the next .so
file rather than OpenCSD using the mis-cached data.

Fixes: c9a01a11dfe6 ("perf tools: Add support for decoding CoreSight trace data")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3fce3c357943..fb4582dc378e 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1213,6 +1213,12 @@ static u32 __cs_etm__mem_access(struct cs_etm_queue *etmq,
 
 	offset = map__map_ip(al.map, address);
 
+	/*
+	 * Clamp to the map size to avoid putting unmapped ELF file data from
+	 * the .so into OpenCSD's cache as map data.
+	 */
+	size = min_t(u64, size, map__end(al.map) - address);
+
 	map__load(al.map);
 
 	len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),

-- 
2.43.0


