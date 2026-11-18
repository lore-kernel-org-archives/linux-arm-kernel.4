Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A84606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhP11YfI;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CpaTE7fI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rTvXpEQ89nznZPWxi0xSOEtJetC4t1T0N57WoEYU+Xo=; b=KhP11YfIqG7b2n
	KVmio05XOxW1PP35SVZtWDPMgrQLxgq0SzTLI4C7HovvBs3yQNA1WV5ZtTpJcVR4zkY6+HODS3S7n
	+UVtA4uogUzbBWua8c5OuEK1Klq/0ky8NKKWeiuNmf8QQ5ZwZY/kYVbaCg3uqx6b/6KpfMcw+RHa5
	gW5iEmCf60v4RMUfGOnK7n1lsdAYVLrSjB3Sg4YqFwKqAK1iLB55CklX53o8nqG7RVZGdaoT9kwnC
	4DDZQ/HU+sNAkLrA0BzWtZAa851+SZii8lAXpwFgsUFoiUZwlt6aZvU6tKpoaVanX1ZWJvFT4r6uq
	8UHKPpnlfZTZM/+r2mCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZI-00000009VaN-0AIi;
	Wed, 18 Nov 2026 16:31:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYE-00000009Ua3-1sCJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso13639045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019423; x=1795624223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTvXpEQ89nznZPWxi0xSOEtJetC4t1T0N57WoEYU+Xo=;
        b=CpaTE7fIxx4qG4lSp8DAD0rruT+EGIQogHPQAU6mFUFVqmMJXlLSPmtV1Kj/tcFxyO
         dQ74iHcdoxbjzP29Kr9WFNiNN7iwGfr6BdCK8I9W5yJgh8pmc+xg5NnF0sgdKfFDgznP
         4+L/6yEK0eeRk1++UTeU4l5TPR42awGhCI9GzOwUtvG/h3ezZjl2VdEUyuiUZST45593
         s0+gN6BYncPunRuUwlQKH2yWnSBH17qQwdU2/HaBEeMIA9rzvB1kVFxy6qUPfs/Ilg/G
         3t3OIuEqFZVEpjolhR7SG1+9OKf+zXKVUaqMClNBMLWJ3thdZcD0cXHJLqdo6OeHDZ45
         1gpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019423; x=1795624223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTvXpEQ89nznZPWxi0xSOEtJetC4t1T0N57WoEYU+Xo=;
        b=ydWm73jeKT7HJ8c1e3nSn8Qq1/uamZ9nkkQPvLbpCgNBqYQAiTw/T1l40Osybexe9H
         Z86dnvI6ccf5Ey/sCq8OeAu24dv1eS+Q8DdkDKGeYpqweb02Kz1OavEzJxIRZGbIExzD
         oa3kvvXfyu8u8rilA4xSXvsiLdr31th+trozIzNEPywHgOaijtbXxh/RpX8LKd/WTKNu
         gxjDXwvvN1ScyYs/aHuTGE0vaL4HwaJDpz7R1HVHAHN0uSMNdQ5YAMmzEysAKA33lIGQ
         ZnP2fXDMxgAOnS9sLCIAgueq769gGXTZXfH7YiOLYJa4Dz3UlaKEjhPaRJa92BqaqgtR
         UhKw==
X-Forwarded-Encrypted: i=1; AL+hErF2ez93nWYpR0x4ymttvmAz+VUbdUmzl+kNsWIuAKFRh80K2lPlrw6puONZaBzNc4h08Kv3VlCxCh2S1u2Rtpmc@lists.infradead.org
X-Gm-Message-State: APuU4Z82gMcku/fRxHy42Z1OjyKGswcyxvalO4ycTAV9Yn8Rkh1AFUSH
	B86NYUpxGm+AcJvDo+fXs36sbs/ExOrwdysua5AWruBzgCXHfHnztbKbQU8Eb0wcQY4=
X-Gm-Gg: AYBFou1y95otcS47PTanSrJOZiVitjYu5IWxeuYNZrFA7s0K7Wazg443r1V3MpGiU44
	I8aVyV+VGkAIwM41H099NzGdYG6aBOJjhKZJOYsdXmc2DihICo1plFkBzXuv2V3sI9Cdb0yYMfj
	qCkMzGUQwYOSmNmrpyDZ1o7NJjMEDOmQ+ddoLiB7FUYQ/I5MX00q3tgwOsTwRQQtITNQo7lttcz
	LOsF8teNLnnJ8sW8I9GOBe+8R+8mXQ4+jC56UdumCwXYU9Yj/fd9+j1P5YDh+uknD4E1KiXEyv5
	r5NFtZMgpLw6DCV2GdRh4rX/Vv2iSeqd8x4lrpS9iZ8fxGK7ZdaR8zWiJ7hiDs9aY+gkORR361d
	tiURCzYvmOCI3LOhw8EI2gK/hmj+HxLCLyhaC2KWYfPge+ef9cuYJPVhkSHnyqpzB7pPILyjq5l
	Og18bi8kPq90XKAQWz7vwfsX8k319TOyktjr+HmphS2Ykz6WLA9SzRiEm1AWkR9RqI93Pt9Di9b
	COr9yoyVPVgy8eHWBsRUZVzrceWHNSLHng0rX7UNzeX97+q/LLNwftmrEgblRYI8K0Aqne4vsxY
	GmaUAK3idZiwIt52lwf/0NNkaxy22ofTKFyIhs8UYk6TO20sajr0eQ==
X-Received: by 2002:a05:600c:4e02:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb7da4b889mr64509715e9.23.1795019423221;
        Wed, 18 Nov 2026 08:30:23 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:54 +0000
Subject: [PATCH 32/34] perf test cs-etm: Test trace is ordered with context
 switch records
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-32-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083026_818618_FEFABA7A 
X-CRM114-Status: GOOD (  13.54  )
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

Enable timestamps in the context switch attribution test and add an
additional check that decoded samples are output in order with context
switch events.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/context_switch_thread.sh   | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/coresight/context_switch_thread.sh b/tools/perf/tests/shell/coresight/context_switch_thread.sh
index 2b9c44b86c59..584661cf47b0 100755
--- a/tools/perf/tests/shell/coresight/context_switch_thread.sh
+++ b/tools/perf/tests/shell/coresight/context_switch_thread.sh
@@ -55,7 +55,7 @@ mkfifo "$cf" "$af"
 # Pin to one CPU so the two threads alternate running but record into the same
 # trace buffer. Start disabled and use the control FIFO to only record the
 # workload and not startup.
-perf record -o "$tmpdir/data" -e cs_etm/timestamp=0/u -C 0 -D -1 --control fifo:"$cf","$af" -- \
+perf record -o "$tmpdir/data" -e cs_etm//u -C 0 -D -1 --control fifo:"$cf","$af" -- \
 	taskset --cpu-list 0 perf test --record-ctl fifo:"$cf","$af" \
 	-w context_switch_loop > /dev/null 2>&1
 
@@ -65,5 +65,23 @@ check_samples
 perf script -i "$tmpdir/data" --itrace=b -F comm,pid,tid,ip,sym > "$tmpdir/script" 2>/dev/null
 check_samples
 
+# Decoded trace should be output in time order with the context switch records.
+# Allow 1ms for estimated trace timestamps.
+perf script -i "$tmpdir/data" --itrace=b --show-switch-events -F time,event > \
+	"$tmpdir/script" 2>/dev/null
+if ! awk 'match($0, /[0-9]+\.[0-9]+:/) {
+		t = substr($0, RSTART, RLENGTH - 1) + 0
+		if (t < last - 0.001) {
+			printf "Time went back %.6fs: %s\n", last - t, $0
+			exit 1
+		}
+		if (t > last)
+			last = t
+	}' "$tmpdir/script"; then
+	echo "Trace was output out of order with context switches"
+	cleanup
+	exit 1
+fi
+
 cleanup
 exit 0

-- 
2.43.0


