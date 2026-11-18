Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33D606C3E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2AUhgX3h;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YgeOU+V1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XqjkmMfgNZGBMzqUNuESUkbxBno+SUpnXC2EkRATNvQ=; b=2AUhgX3hFx6Cip
	KRkxdvngPQmYIr7vneQJ1ODSjHi+QnGPrzFfRBKA1xY5AfV619cL3WwhXP6nWP5mLU2Sq6XVgLjxu
	6aSATYMmqJJNmo/Hl2qqnmMrBGN/d0BTyiLAHqmXpAN6RHIkMHH8CC5EGHviJxLP6CWbXjIzGXQha
	8wHQgG5j+pO1TBvi3yaMrTDOfQMcLyazyvhUpecEgiTvtyGo0UITgeQG/uSNmYQ4pr9npubaxwkcX
	9GwduLFv/XvJzCT04E7dXU4FzxR3U2kVKAqHMYeNfG1kbAB+amtenNy49q23pIbU1vz4hez/+bZku
	HYsJkFgM1q8xXrkwAy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXv-00000009UGG-2hGq;
	Wed, 18 Nov 2026 16:30:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXn-00000009U2u-3lIP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:01 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-497614c95f0so736427f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019397; x=1795624197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqjkmMfgNZGBMzqUNuESUkbxBno+SUpnXC2EkRATNvQ=;
        b=YgeOU+V136kid/apnyKbf7hvkHdylUshRM3Stz4gM6jpbDdW2SqcQLtg9MpVAuVg8Q
         7Qy6sFSeO4mHrYtdnJhzXYHJ+JI09PNnKDznkPMrQYFPxnX1AB7Q4HY47SrJHr+OKKqm
         tXUUxr2cCrllViJQXPG8WWSpGUc09slviEESntUuKp691j54bSJe8iXAzpUDwMSvjdxk
         qst5+QR7odjeaGrLRkgaR/4TOZK41nxHj5aQcGSDqsLPDi2KuCR8vmjCxpX5sleez9WU
         ksClPV1B9yS6hWF/46VGUlageiRAQauhlnaVE1jEENqhxgo1EdcGIWSlslRdUcp1Bgdw
         e3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019397; x=1795624197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqjkmMfgNZGBMzqUNuESUkbxBno+SUpnXC2EkRATNvQ=;
        b=lp77GYq0LESp5ts1Nm/MG0U9p77tAfMMYUJM0s4ANDwza9RWLrIpv4YEUW8gNtUjhP
         Vbi2vMxfVku3bicGpGVXsoD8rpOICCo7IrDJz5BRWY4/bLaUS5zU1tP2bPQaVHIdLzhY
         NZPFaVpJg2ITCeZoo0hhZtXBzD/AjzKRWXJb5S+S6TqHLIxwdcLSsD8mBV4FZocLBWUD
         quHHVkb0zt5BKgcLD5QlVp0sUB+4SsGlgYmRyLc+b3HRtfIcPkbJ104F38srywZc7zfe
         ag+H87HCe50g3OmU6vDIQPF1IMmwqJIdsGd7qB6+/ZLk2h5rdIkRPqOgrPPcbR88l3Ez
         BWTw==
X-Forwarded-Encrypted: i=1; AL+hErFlZQiPsdX2TwAMCdSSYwtBqXLJEnxniSxJpOJQSaCfoYyg1BETFyvfMEyscpMp3mnHAt3EE5+Dv9V6v6By/jQ8@lists.infradead.org
X-Gm-Message-State: APuU4Z8XYGVfB/sPZEEIYPP1NnjNca/2zQm9Am4Voz3RE497g7NGrGUB
	B6mAzAa/yUgjV4eVnVhLtm/FLBAyUdT7CoU12IgWg4JRJOxg6MVBCRJcaA0bDNsqHZU=
X-Gm-Gg: AYBFou2yuOhL/Uffyd4sTbchIkS71igbrnv7gJpSplvllK9207CaYeKPIZ1iUeEHjRc
	12zTsBZNl564qmFyDdtZdUvakOu3vPKlHnac+oCoLkHIyoDvGqvfeYl+IbXuhc42ejDY6ELz0Bl
	CcSa2f9ffqjCBs+mJYog6O/c3+jRUJ5WKJ2/MELMkrJfQ91e4yJeGBBvd5tCItL5hkv03uAkCeC
	EDsemLgYBgO6TX1/IfkUk7IsPvFtpSEko3atzh4cf4hHW0MiK0dZwDaw85t04LJsZt1fKoXtF7U
	asGicPKT8rVE/5Hnnr6eiyfjDfWrAApfYl+5QbgzsYgqkOpHzqt7wo6CDLcU5LwyvZX/XQQ0hpP
	R4jaslNWE05b8TQj6Lktq2TgTFDOfxZ5IPjz9ey6l9L2cZH02Xl2FUUe9B/kKV+sq+VFlI73yft
	eduhgQ/17zYvxzV6vObWsDatCw/hWgsVxAqssY2152QZCUCWFSqbvIVlASjO5WQfEFkR5NE6r/r
	0vzWUnXebTtAyWOEd6142069LFV5h5UJEHMGnq2TNbovVjDB8WUvasg4eZ6pH/+pUBtj3FO+KEW
	hyprbc9IrDMj4VzKIwE7CbJjOYQ9VoLK
X-Received: by 2002:a05:600c:83ca:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb7da26fb7mr62550495e9.19.1795019397271;
        Wed, 18 Nov 2026 08:29:57 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:31 +0000
Subject: [PATCH 09/34] perf cs-etm: arm-spe: Report error if default clock
 isn't used
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-9-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_082959_969655_9621EB21 
X-CRM114-Status: GOOD (  13.72  )
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

Coresight already reported an error if a different clock was used, but
this also applies to SPE so add the same error there.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c    | 2 +-
 tools/perf/arch/arm64/util/arm-spe.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 809da6f1a892..5a64c17cf254 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -365,7 +365,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		return ret;
 
 	if (opts->use_clockid) {
-		pr_err("Cannot use clockid (-k option) with %s\n",
+		pr_err("Cannot use clockid (-k option) with %s, can only correlate samples with the default clock.\n",
 		       CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
 	}
diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 53899c7de846..834419f04617 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -416,6 +416,12 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 				       evsel->pmu->name);
 				return -EINVAL;
 			}
+
+			if (opts->use_clockid) {
+				pr_err("Cannot use clockid (-k option) with %s, can only correlate samples with the default clock.\n",
+				       evsel->pmu->name);
+				return -EINVAL;
+			}
 		}
 	}
 

-- 
2.43.0


