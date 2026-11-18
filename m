Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98871606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4J81gQhb;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x4s8eiLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=koGbjTKVOAqnRDV7YAPg63lp37cXx2HU92d1Gce8qkQ=; b=4J81gQhbE7OEjm
	vWSSYUyyyFtoyIXXtWNwUghF8tnJ+ojEgiru0OXmeqF3R+FgORBxqMEeEq6/3Z7/jDau6afTPIJzR
	rc5GKO1Xp5sG1TV6z74BP+Y1EFJ9KemA+rL/4hJLDwSRFuOWggq5fLYnQL32ziXKqzYLNukOCNMtG
	HiFqRmX4+h2CRSXdvLuTQam7k/x9MhJSvCGo/EiV+W5YdLPtqWordGJZ0RiH/hvV17MOvhuEnByIN
	eOvhOwgUE6+yUt4w7qqJuV4plsKJGZRYZfD2+bOAnrwXum8FJxWNvv7mgfbTWKCz3NVpJcVTOmxE5
	fDLYYoFGMVcZlJREWILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYr-00000009V0Y-3BxN;
	Wed, 18 Nov 2026 16:31:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXs-00000009U97-2P1l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so765857f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019402; x=1795624202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koGbjTKVOAqnRDV7YAPg63lp37cXx2HU92d1Gce8qkQ=;
        b=x4s8eiLSzAXfJDhZTzsI+qMI62Z/tKF17vkEpWSKxtWC0LvgWSN+jtvSeBpVI08E++
         G7TnUUu93kywde4vgExmr9zif50eveaKWCN+59NDWvnv2+y0V4ghKtHusEheUFuZQXHk
         +3cX8qXZBkwAVaBSRccXzaEEMk4BmZ0vWYwAT3R/uh8ptt1Ec7LUzLFqwUBJiiU2CxIv
         r5bJVOT2p+bQd5V0Dzepghip1SRuyRVpn0JyCH+xQ2YVvqMX5N+mdzte67CxiKPBEEu5
         +lX5N8YYLUA+yvpDkvMECQgw20kHWnfa6atVsQRP6gDyQsOiJBt/CyMlUaaaZX+1OEWE
         9vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019402; x=1795624202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koGbjTKVOAqnRDV7YAPg63lp37cXx2HU92d1Gce8qkQ=;
        b=jSwVjmttJCEzpWqfXfiO19LnCMGGB6Fb65WyoF7tlfP1ZFIu7l0dkE7ru8WqWrNKIg
         dCEznYJklLhfK27QiII7WWXhzUoSFYpivjXon86Rm/cJIbGE5s8qr7sz4+nTjXWWnEke
         Nip50TekV07yeg+w8OfjZ1qK6IBR18dh8wSbbCKG0N6zGKukj9FuR6MrySVdfsUHREPa
         zAm1qEx9aS9Mj9Rrpuv0LWYJKqi/SUuye98z+uCHwNKsqqAYjXfdE6Hj+XQxRTosL4op
         ihAP8ZlXfO/83xkuvKIXij2hoGJ5pZloPw5Ze9fEOqnCV04AlS5nvfBG+YoHHzYuThsD
         8jLw==
X-Forwarded-Encrypted: i=1; AL+hErFD08oQgfd2uiCQC4wVcgjQ/BwnoHkd7+VI/JHyICytxyUILHr/eEwYsbD3Dl/GDVuGjzipeGvOylbyswb4JWIX@lists.infradead.org
X-Gm-Message-State: APuU4Z+qztY5P5FpN3Kdr71oTvLYhO6Hw73AzviNqrUnakTzFgdAi8jD
	E14nuxjiFEK/DqlIUgw0ZkBVU4enoGtsZIj8eDDTmwqKEvEJi0KZWDglJ5/XQg0WSyE=
X-Gm-Gg: AZFdTZfJxlaYB59cVDLoYanw0CSKv6jZ6btMwcRG/nd0H5ZcjnmDJWfekwsLlxcEXxl
	XTXyTMt8BzVK/5y3KESrifE9l0yP6qt+kgyPr4XqPNZYHuzw9qFt5IbRQTfQ7GK1k/ZQUPmKS1i
	eY4cepHsP/aM9JgEwaEu+/H+gWwIjQSlpKaZxol8Ffe/Ee/wyA7KTVC//rGBx5Ib+3eoQ7WeoQn
	CuhNk7b5Ip/zA+XTPOJYHwKaA0a4ZCIsRaAaNklhHSA+BnLMwvgLhbrl5OnRa46r4TOOeOfFfkk
	CpweL38NISmXTJabHxAgawwfBWScKo2gCmI7Ey0zO/vuWYWiUzZZ0pb0D/hpBkymmaT17I1qSXW
	5cOF31k/9Hae2IBNonstcWFmywX/+oo2GR03YtWlTCBKDDOTOj+fbH0CJ8sbd0J02DfRnfefZkT
	97v5rdOP+RzaCvdbjpzDPcQ02US7N2SEiXFVvGN1M2Hwa+WhPNTNIN+kVVYwmsen4ag4gEXD5Cd
	PjbMNnSDBhfdEodkh7dDPbQ029eoWT3FJ5ig8yzHTzth7JHBbYRJOLgK5/P7b+qK5ARIfnYY9dV
	b/LmgKLQbfdHk/gqAT+j+wc4e9W6UlsB
X-Received: by 2002:a05:6000:2608:b0:4a6:8012:198 with SMTP id ffacd0b85a97d-4a6801202dbmr5316972f8f.31.1795019402218;
        Wed, 18 Nov 2026 08:30:02 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:35 +0000
Subject: [PATCH 13/34] perf cs-etm: Handle PERF_RECORD_SWITCH events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-13-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083007_029482_1D33BC7C 
X-CRM114-Status: GOOD (  11.81  )
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

Task bound events use PERF_RECORD_SWITCH events instead so handle these
too. Furthermore associate the current PID and TID on
PERF_RECORD_SWITCH_CPU_WIDE events as this is just as useful as the next
PID and TID.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 1e1ff6cc8a5e..4252d25c991d 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3016,12 +3016,25 @@ static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
 }
 
 static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
-					   union perf_event *event)
+					   union perf_event *event,
+					   struct perf_sample *sample)
 {
+	int ret;
+
+	ret = cs_etm__associate_tid(etm, sample->pid, sample->tid);
+	if (ret)
+		return ret;
+
 	return cs_etm__associate_tid(etm, event->context_switch.next_prev_pid,
 				     event->context_switch.next_prev_tid);
 }
 
+static int cs_etm__process_switch(struct cs_etm_auxtrace *etm,
+				  struct perf_sample *sample)
+{
+	return cs_etm__associate_tid(etm, sample->pid, sample->tid);
+}
+
 static int cs_etm__process_event(struct perf_session *session,
 				 union perf_event *event,
 				 struct perf_sample *sample,
@@ -3058,7 +3071,10 @@ static int cs_etm__process_event(struct perf_session *session,
 		return cs_etm__process_itrace_start(etm, event);
 
 	case PERF_RECORD_SWITCH_CPU_WIDE:
-		return cs_etm__process_switch_cpu_wide(etm, event);
+		return cs_etm__process_switch_cpu_wide(etm, event, sample);
+
+	case PERF_RECORD_SWITCH:
+		return cs_etm__process_switch(etm, sample);
 
 	case PERF_RECORD_AUX:
 		/*

-- 
2.43.0


