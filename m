Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2C606A7EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vo+gIGcX;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iuNAMOzx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=++mNA/ATFG+JHWKfnq2DLe8hXRW/WLweLbt37GPodEU=; b=Vo+gIGcXmSJ8Pu
	1L00j8Vpqg4ec91uSQS6R7h4Ij1m/8jNhyQre20HydxV+KcfsbPeiUL3HxK9xpB9S9L+kQ87ndxaB
	Jw+JdwQpoYk0eitX70+cNcSuG4Td7P72elQSdiU1XMOMTW635s0y7ir+am8J7hIpLPfyniw6G5saH
	iZieQlMWbqkLJUgRnpNsf7t88J7c0cLOEam+DGLl7FuZg+NIoZAdzxwzi8Aup7z+QYrR6UyOtrgvA
	2zIcduv14pmJuihiDcNw9Bo+TPLGurvN3ZZDyyta0on/M73AOLeXFS6XkMQ71pbYTj9aVtiRaEAwT
	O+TENayYhUHfxY5SWlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZA-00000009VJZ-1zyQ;
	Wed, 18 Nov 2026 16:31:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXr-00000009U6V-1x86
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-491846221ffso998314f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019401; x=1795624201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++mNA/ATFG+JHWKfnq2DLe8hXRW/WLweLbt37GPodEU=;
        b=iuNAMOzxZW4jfCx0qdrIvOieto1NUzjOxsdmW4oyFw5EU9zAck/+BdNF6dijHlD2V2
         xpQD0Dn1pTca2dff3N9aK4DjEtk8tcFHgYzCvq6kBTOuLAlU+LUd+j31Sl9/SuJbnMek
         vF5tUPgy8NjBqzzckUJT62dhgrwxUkR+fauFa9q5AgI1AoFcxqtLOQS4A0DNA1URDtMD
         AiiLYVhEbeDhz2j9s0i3xI9iCPL1WDurWIeJ/hRtSKeQ1CJYpmwlrQIFMCjF8HwQRwB1
         XCuZWQc/t8dZQsiAX+Fqijp6wUFSXN1XfE3LS2j0c3R+/nBylxf7IV8GDlnV+JsmDx40
         InOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019401; x=1795624201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++mNA/ATFG+JHWKfnq2DLe8hXRW/WLweLbt37GPodEU=;
        b=BnzWaZDzTWv/juIJCJPg7x1k1JGsArGayAF4yI6Q/8iRzt/rN5GCdAcRY6zvUz8VcP
         +tBxa4iUd5xtfZHOXobhpXUG7p8aw7P8Epo12NzjIlGlzSLhGjdRgib1jLlCW7p81IYZ
         SLcHPYwBQnUun/ugEI2ghlf1kAd5GEFUC3SLFDtRkR3e4HIdSSZEP+w43Sjxz+Llcv6g
         04QuItAB3I5rKkvluQ+pvAhhTM/aoYK5iAXHk/CXOmCp3B7UNE8WEl58gXGWCrmBE1HJ
         KFwJ0gToGH0wzwX4NITsG32SlHpUCvVSW/BmzD17VD8SVWk3Pc/Ene1hWpToMD5yXNZE
         dSxQ==
X-Forwarded-Encrypted: i=1; AL+hErFrY5CcOyt96bjT0nslzI2Fdrtm0VZ57og+FLEMrAr2XVES7lSTHTmRvs58/OF1A43oAA6DV6HfryMDhUTXSHgz@lists.infradead.org
X-Gm-Message-State: APuU4Z/ObDwntdnC1+n8Ho7+UCG8EIvhRb9PfUWv3HJT4JroD5X55Av6
	SlQMmpKLxpipbHofPOqf1N1+6tMM3Cc++/xHhfpk/9y7EsC0v5lyCgZL7NgRSzsjPbc=
X-Gm-Gg: AZFdTZdls90EHqLzFgZKwuEbrzjWvuhTND2caFI3yFWjo624WgidkIW+gyxbzjW4HCN
	MLVGi3YEhCDqAunl/TVgaB4Q0QEXIx1V1d5koMkrGJN9p+jYLAI+MzGyOFq7yBMdiRBFHo7md25
	TW14W4EEjN/V0U599xNt+SMBRLahte4aOfSsUswxYWKja2TTcpgc1AolkAqcyo2PJr4ZWYlZStx
	bwBkwn1ELSuNcTDkXqWAw0H2tzUz2fd1yWoInJjOAcbHDiufo7H56QfJ8/QYeI6zlphULdBKjPM
	6M3hSNH8NC9IxGYvZFmjwWJy7N1aNgHouJQ/2iDwbq4qAPKPxUJBXtYj9BQGp0Yg0XaMuKZym9o
	QxftN67dYq9E5srX7XKwq3Qtf1hkwsSVcRvxjOyH0qY5kEMcZb48T8cmFfwlHZiUaeUq0G4arKe
	NXbte7DWopNgIUiXH/AN+yWGwICYLJBD5mMkER6IdOz/yBUNDQSleAqgaVbYt7wNn3mRJuNCnlJ
	djY26VY9YoBTmgNC04LdBE6jduMY9Vv3hdrN/lB6WGg9pvC1IeRGBrelgov6fcOUPtfP1Hrnqw4
	xexQhziBmkPkRw1gvr1jBK3OFJTJoR22
X-Received: by 2002:a5d:5f45:0:b0:4a7:a8f:527a with SMTP id ffacd0b85a97d-4a70a8f55cfmr5263386f8f.7.1795019401089;
        Wed, 18 Nov 2026 08:30:01 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:00 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:34 +0000
Subject: [PATCH 12/34] perf cs-etm: Track sched out events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-12-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083003_585370_557EE061 
X-CRM114-Status: GOOD (  12.35  )
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

The sched in event might be dropped due to a full ringbuffer, so the
sched out event is still useful information if that thread is going to
be seen again. Call machine__findnew_thread() unconditionally as it's
harmless to do it twice for the same thread.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 67e3e2becd0f..1e1ff6cc8a5e 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3018,16 +3018,6 @@ static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
 static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
 					   union perf_event *event)
 {
-	bool out = event->header.misc & PERF_RECORD_MISC_SWITCH_OUT;
-
-	/*
-	 * SWITCH_IN events carry the next process to be switched out while
-	 * SWITCH_OUT events carry the process to be switched in.  As such
-	 * we don't care about IN events.
-	 */
-	if (!out)
-		return 0;
-
 	return cs_etm__associate_tid(etm, event->context_switch.next_prev_pid,
 				     event->context_switch.next_prev_tid);
 }

-- 
2.43.0


