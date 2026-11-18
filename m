Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E8606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A75qUOVJ;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cdHCX7d0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rpi69KOE+RewZqGKWGe5fV1itNLcgLER2USO6GkvbTk=; b=A75qUOVJ4vth8S
	5eZlcvIWY8cfrPZMhxru+/K0rBXJ/SL3IY9NuFgVnt1UUAKD68PsMcH1P1Ik1wvijaKA9dWzkGwzJ
	rKY9WQGyj6V6p3tZfbSX2Udw+BoVRbXRF31PrvZECbsQW+576C4JIk+I7xcBXeHlz0t1a6v7kjYG1
	UcfmdCMTEzXV+WFwKnoIMfINBSKUiXR1uP3kXrktDM4xafdy9Nrzaj6WHFkqUkxYv2ZVIBCzS5db0
	orx8g8j50qfVUIv0XQkaZ6SUiSJjwqcsxeAL4SEa/liY/XndBkf24jb70ugfA7Z2VzrddzIsRQVy5
	AU8iIl/MCxyMc6zMy9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXr-00000009U93-00p0;
	Wed, 18 Nov 2026 16:30:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXl-00000009U1a-3e7D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso629871f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019395; x=1795624195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rpi69KOE+RewZqGKWGe5fV1itNLcgLER2USO6GkvbTk=;
        b=cdHCX7d0Zdzl4JHc89I7R/jTouMpLzGcowhPpdZ485nczNni8K+ZDGMDRhnSaMkkuz
         xEMs4S/d+TUcyEARW2K5Hrq3Jy4gdHwWY9lMuR11QFmS1dU6cZ4+j68lOtH7HdWbHeum
         CrYJ9Ln0af1pfEbtl8RbAgOxLL+XdTCYKQksOURjwXU+wkepgj4cI1HX1R/Lduk5u92U
         0YLDDxsnJkITDi+g8kg24aYdOMx3TShzmhla0Rc8ilZp6VRP9bcgE3KzR9op/K7Zz7bI
         FEcWdZ8OGKv2FErKKiAGeeRW+kpBzEyn58KNZZftz3Ww/T5RXagP1QTbi1IkDjYInCi8
         mK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019395; x=1795624195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rpi69KOE+RewZqGKWGe5fV1itNLcgLER2USO6GkvbTk=;
        b=NEvTac78Aomt/MdBXDUU8becWK5Abd7OrszLNcKoe1WKMU7xW0sT0lVZhfVgrmPrMn
         iz6ZDJI4HP4p/m9ZSdriqzGcK3/wICYFfCiVGj1HMvie/YVwCmRu8Yo3rwTvLhzu5R2G
         0NmcEuuNPfZwNbXFjt5dYB830HIaMsn99L6Lf2wvdUTCw2KwW46THaCR0scWpnVEo8j5
         808oOjhwhsy0WC3t4jkinnj0JvgMvP5xC4h1qNAepVvS3cVRnja8KkWZbCT7ZFsqrldA
         8x4kRlJTpRPgJ7JLYYpqQWeQzG4de1A9gmgn2xpldITGSNBXAymtJ4p1FiCqbm0N481K
         fC5w==
X-Forwarded-Encrypted: i=1; AL+hErHtotHUXTpi6FF//w9ZYnTjXBkB8XZ37UR3/8Uil42zs4B+kfVAPUsr6tDrcc3yPokCnk95O4UcLWznUuw4FVb4@lists.infradead.org
X-Gm-Message-State: APuU4Z+BFpXMXhnRsbtijOmI0VzCtbQiXwvLJPvZNFaGb3HXD0r3usN4
	q5JlZr/kbvaQ066Ydo4SDmyT/kaQaXDnem0a1M1zb5P1mPc5SU3dMIcDD+fOT34onXY=
X-Gm-Gg: AZFdTZc61sQOSsC9fcGmw6q354XR9yWG4SioOF4lhUx9zvao3LgxMULjLyPmicIs1jS
	fXbi4+IbhedzivSFJECZesuMPlIPft6PeQQPGlaO983UC0OpI8UFcBwYiVfO5mjH3hfAYpCYlhS
	3JjfS99UWslAtLd+BSe10Nx4LoQfXYSX1ONxi+tT8j3M95iLEajg3CHi1O5b+fnOMD4Xa4R8pQo
	jhv8gCYkkRKZyPoF4Y0wQ2h98gZ52786pllAdo2vfrhIEEb8LeQ+WJD6JH7XnBZJWPijpUWjQ/D
	p0/L5V8wN1ZO6NfUjdB+Mq2JfETwh8M9KY6UAmBOJO318Yd7kFicexpQwgpLXcGjyEgEvgN+z4v
	hjFMAdgtT0k8hKbDIYmOPJGk5f5sAQBSJwy9tZ/U2j2aJoyk6jCbdD1Re+2E9QZb0ivMTWb9sT9
	SAiGZzoyYoAqsSwrujv2HYz6MWFPi5DR/b9E2to/fUx5siL9e3NeS46882GZ0OqzeGCHXzgiSMd
	kZo87g/d72VzmxOIv6rTcDhi6cVFvlqhYl1ueSNJX15rr+QyCmjCikWcCZRlhPFaGgvan55ynpB
	O0keccCh21nGctnlx9NH/OtmTi+Xmkd5WQ==
X-Received: by 2002:a05:6000:1a8d:b0:493:c0a:507d with SMTP id ffacd0b85a97d-4a63648e24fmr6898857f8f.1.1795019395221;
        Wed, 18 Nov 2026 08:29:55 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:29 +0000
Subject: [PATCH 07/34] perf build-id: Cache the vDSO in build ID mmap mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-7-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_082957_949349_6F325783 
X-CRM114-Status: GOOD (  20.02  )
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

Since --buildid-mmap became the default, perf record doesn't add the
vDSO to the build ID cache. Caching a DSO requires its build ID, but the
vDSO doesn't have a file so the kernel can't add one to its mmap event.
Build IDs that are missing from mmap events were previously read when
writing the build ID table to the header, but the table isn't written
in build ID mmap mode.

This breaks decoding of hardware trace through the vDSO after perf
inject -b. Inject adds a build ID for the vDSO, so perf script looks it
up in the build ID cache and can't find it:

  CS ETM Trace: Debug data not found for address 0xffff95edb310 in [vdso]

Fix it by reading the vDSO's build ID from perf's copy of the vDSO
before caching it.

Fixes: 53b00ff358dc ("perf record: Make --buildid-mmap the default")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/build-id.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index 02233ef0eaff..cc813f421c9b 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -886,6 +886,18 @@ static int dso__cache_build_id(struct dso *dso, struct machine *machine,
 	char *allocated_name = NULL;
 	int ret = 0;
 
+	/*
+	 * The kernel can't add the vDSO's build ID to mmap events because it
+	 * doesn't have a file, so read it from the copy that perf made. That
+	 * copy is of the host's vDSO, so it can't be used for guests.
+	 */
+	if (is_vdso && machine__is_host(machine) && !dso__has_build_id(dso)) {
+		struct build_id bid = { .size = 0, };
+
+		if (filename__read_build_id(name, &bid) > 0)
+			dso__set_build_id(dso, &bid);
+	}
+
 	if (!dso__has_build_id(dso) || !dso__hit(dso))
 		return 0;
 

-- 
2.43.0


