Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302260A2631
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WEqNBbJ1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3g6i/Yz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cYXD2FWmrnnRZk6eOj0Jj2xBjZH/opG+pmsIgNjn1qM=; b=WEqNBbJ1XeQ+AZ
	ohNPcD06Mst6xbLBc4a3zAkcoNB8IsLX11rZOWBWz7xAeQ+mr4RwTW3ZMLyNLlSNmt4JVC9P865ZV
	d/SD0HOycImIItbQ3pe6dfwtTs0zhUwS0a3/AjsfgkpTwROfqxeg/GIFXGfzYY3fkNON8GgkZzJKf
	TNrN2NL0SqeaxgKuniu6KrTsF4sw0AzRcSIIEbOvQZLkU+7i0Hv7ZIMWS1Rn7Eyjp16qnSihrLMJX
	P+XZuC2ykrwzqDE061SUUJG6mFgnrTZH7oe4dsGK9wTXb/BbNc+0zTXzYltQ2JHW03bpe6y41pjsW
	95UdeTihglH3n6pcW1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtf-0000000F7wt-0fWb;
	Fri, 20 Nov 2026 13:43:23 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtM-0000000F7fN-0SWx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:05 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3282db206d3so2397834eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182183; x=1795786983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYXD2FWmrnnRZk6eOj0Jj2xBjZH/opG+pmsIgNjn1qM=;
        b=h3g6i/YzzVIK2Sfidtj0VsxUc6vF0xVIS3GbCXKV998k5dkJaOBTTjxpAvwvyCWuMi
         Q2tu9jaekci8pQnKxaB8VBAz9Tepg2bg7HbMsaZ9dp+p+U+GM7mfUfltpynXCtXMaHYx
         uejQUzn9f1oKPHBsEqdH1/jQC+VkEUknvSIYujel/G8t75rOsBQAeG+lkhnylevA8PuB
         F2He5QmggAniJ5Jfyl8wYh3Tnx9w+vw+C6Q+CcRqjMLTbcKt6YpKNAPNUcdI4PmETI9L
         gEuwNl2JwQMzY4h4HHuiiuHEUE2cfBLN6Pa3Mv5WxPDJWBeAP5gca+I2kcaPo8Tsdo5f
         6yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182183; x=1795786983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYXD2FWmrnnRZk6eOj0Jj2xBjZH/opG+pmsIgNjn1qM=;
        b=lOQ/skUDd2ybr1N/v8lcMf1N7g1Oau7e2hMKLPEn6wV1cC/UecZD15+98ML7w+C9KD
         I1hG3/uru/dxnNs9w9HrOSFl2lS72ZhFtbRAr1H3NJNiNrY+awD75fxZcho4GUjI5Hk8
         MZIKbomuft1CDxOLiuTUcZHLm10G+uIa27NIVARPi7iZNh4+J+UGCQg001HFG/HXy1xW
         aDdIBPS25ud8zMuiYqa9KzLd2oR68f1k1K9J5a8IDlhNx4uZ7B7B7wsz4LlN/y+JWtwp
         Y666eypInXO+2wX3l7JAFcHllfhxAprJ+wOfwosH8NqfEMKzewBlXvXOUaa6EJJ06ub+
         ycyA==
X-Forwarded-Encrypted: i=1; AL+hErGfYGFc5ud3PPKDHkjWwSTJw+zTkITBU86LuMmPq7yX+UCM7Gg8jIIt2gS9L7yMxy1pxTeVKLpTxeqcP3NHzVZO@lists.infradead.org
X-Gm-Message-State: APuU4Z8Wpwx44d7H7qgY1oorD5wR7uh3CyidmbLsZuutlx/gKmQBXe1a
	fb3TzJ7olLM2uV7BkZ2IzQ4YDbdsH+uY8pCMZhHTIxgOZv1Mpk/ptfux
X-Gm-Gg: AYBFou08N2kQotDD0ii+sZWa259m7hurisZCRsX7FXb8Mkk+LhbxDYx79qgeYmx9KWg
	WhVm4yrqzSO4YRCDz8JCxrPmr2n0DRnmf8rVRe+BZ56wqoTdzBmoPQtcBS4tmoy5dXLOGz3n6bh
	eV0VLioUqxEe7Je6XTEm3jZoB6JxuQ/S9+fYGB8cGx6B7HRnepjAc32VChyVg2spBerLfoZMU4B
	834P6JljpUY7L2pDT6wGnTZJV7ThZYfLIa49TRc+kYsYvqW9sttweDxSJ9tuzHZHjWgDWd+7jqO
	xhe5DSPTBokz/du+RiupA6bm6b+tMdfEH1s0O5ZJZEytgK1wXqxYvV2aT9XKP/y5U2f1vpQ4oHA
	Tos0vs/1rf1uiWUvajFgJHMW02d66x/JU8bRV7TZJyjTcQopQMWEFRRLxG34NpXwFT3VDBn+Cqk
	dwNvyeC0l+mzCFpTf2bSeOSBDvirRujMi1iiJSNpdp3vzw8u0B+CKA6IqXBIlirCRe9VIYIUJN1
	uFntel5ofBRQVVd3WrF30sSqci92E9Uj9cPFelLOGHJGeGqnfnSq6zJ+gTWCWYrZ4RR451MdVwO
	EoBRFYhN7VaKMwRlFpNP
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id 5a478bee46e88-385ce953221mr2127751eec.30.1795182182938;
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9590857eec.28.2026.11.20.05.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH v12 2/2] perf jevents: Fail the build on a key the tables may not carry
Date: Fri, 20 Nov 2026 13:42:52 +0000
Message-ID: <20261120134252.1036963-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120134252.1036963-1-takano32@gmail.com>
References: <20261120060931.711483-1-takano32@gmail.com>
 <20261120134252.1036963-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054304_152909_D5413859 
X-CRM114-Status: GOOD (  21.35  )
X-Spam-Score: -1.8 (-)
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

jevents.py takes the fields it wants out of each JSON object by name and
ignores the rest, so a key that is spelled differently is dropped without
a word and the object is built without whatever that field held.

Compare the keys of each object with _valid_keys, the keys a table may
carry, and fail on anything else.  The generator already names the file it
was reading and the exception names the keys it did not expect, so the
build stops with a message that says where to look.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator on every arch directory, with and without a key the
tables may not carry.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/jevents.py          | 24 +++++++++++
 tools/perf/tests/shell/jevents_bad_key.sh | 52 +++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..1baeae76349f 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -63,6 +63,27 @@ _json_metric_attributes = [
 # Attributes that are bools or enum int values, encoded as '0', '1',...
 _json_enum_attributes = ['aggr_mode', 'deprecated', 'event_grouping', 'perpkg',
                          'default_show_events']
+# Keys a table under arch/ may carry.  jevents.py takes the fields it wants by
+# name and drops the rest without a word, so a key that is spelled differently
+# is only visible as a field that went missing; a table carrying anything else
+# is an error.  The list holds the keys jevents.py reads, plus the ones the
+# tables carry and it does not read: Counter, CountersNumFixed and
+# CountersNumGeneric (read by nothing) and Experimental (read by metric.py).
+_valid_keys: Set[str] = {
+    'AggregationMode', 'AnyThread', 'ArchStdEvent', 'BriefDescription',
+    'Compat', 'ConfigCode', 'Counter', 'CounterMask',
+    'CountersNumFixed', 'CountersNumGeneric', 'Data_LA', 'DefaultMetricgroupName',
+    'DefaultShowEvents', 'Deprecated', 'EdgeDetect', 'EnAllCores',
+    'EnAllSlices', 'Errata', 'EventCode', 'EventidCode',
+    'EventName', 'Experimental', 'ExtSel', 'FCMask',
+    'Filter', 'Invert', 'LegacyCacheCode', 'LegacyConfigCode',
+    'MetricConstraint', 'MetricExpr', 'MetricGroup', 'MetricgroupNoGroup',
+    'MetricName', 'MetricThreshold', 'MSRIndex', 'MSRValue',
+    'NodeType', 'PEBS', 'PerPkg', 'PortMask',
+    'PublicDescription', 'RdWrMask', 'RetirementLatencyMax', 'RetirementLatencyMean',
+    'RetirementLatencyMin', 'SampleAfterValue', 'ScaleUnit', 'SliceId',
+    'ThreadMask', 'UMask', 'Unit',
+}
 
 def file_name_to_table_name(prefix: str, parents: Sequence[str],
                             dirname: str) -> str:
@@ -196,6 +217,9 @@ class JsonEvent:
   def __init__(self, jd: dict):
     """Constructor passed the dictionary of parsed json values."""
 
+    if extra := set(jd) - _valid_keys:
+      raise ValueError(f'Unknown keys: {sorted(extra)}')
+
     def llx(x: int) -> str:
       """Convert an int to a string similar to a printf modifier of %#llx."""
       return str(x) if x >= 0 and x < 10 else hex(x)
diff --git a/tools/perf/tests/shell/jevents_bad_key.sh b/tools/perf/tests/shell/jevents_bad_key.sh
new file mode 100755
index 000000000000..6084205b5f4d
--- /dev/null
+++ b/tools/perf/tests/shell/jevents_bad_key.sh
@@ -0,0 +1,52 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Check jevents.py reports unknown keys as errors (no_mlock)
+#
+# A key that is spelled differently is dropped without a word, so jevents.py
+# compares the keys of each object in a table against the keys a table may
+# carry and fails on anything else.
+
+jevents=$(dirname "$0")/../../pmu-events/jevents.py
+python=${PYTHON:-python3}
+
+# An installed perf has the test but not the generator, and a python that is
+# not there or too old to run it is a skip, not a failure of the check.
+[ -r "${jevents}" ] || exit 2
+[ "$("${python}" -c 'import sys; print(sys.version_info >= (3, 9))' 2>/dev/null)" = True ] \
+  || exit 2
+
+tmp=$(mktemp -d) || exit 2
+trap 'rm -rf "${tmp}"' EXIT HUP INT TERM
+tables="${tmp}/arch/x86/model"
+mkdir -p "${tables}" "${tmp}/arch/common"
+printf '[]\n' > "${tmp}/arch/common/empty.json"
+printf 'Family-model,Version,Filename,EventType\nGenuineIntel-6-97,v1.0,model,core\n' \
+  > "${tmp}/arch/x86/mapfile.csv"
+printf '[{"EventName": "a", "NotAKey": "x"}]\n' > "${tables}/events.json"
+
+if "${python}" -B "${jevents}" x86 all "${tmp}/arch" \
+    "${tmp}/pmu-events.c" "${tmp}/pmu-events-string.c" \
+    > "${tmp}/out" 2> "${tmp}/err"; then
+  echo "jevents.py accepted a key it does not read" >&2
+  exit 1
+fi
+
+# The generator says which file it was reading, and the exception says which
+# key it did not expect.
+grep -qF -- "Exception processing" "${tmp}/out" || {
+  echo "jevents.py failed without naming the file" >&2
+  cat "${tmp}/out" "${tmp}/err" >&2
+  exit 1
+}
+grep -qF -- "${tables}/events.json" "${tmp}/out" || {
+  echo "jevents.py failed without naming the path" >&2
+  cat "${tmp}/out" "${tmp}/err" >&2
+  exit 1
+}
+grep -qF -- "NotAKey" "${tmp}/err" || {
+  echo "jevents.py failed without naming the key" >&2
+  cat "${tmp}/out" "${tmp}/err" >&2
+  exit 1
+}
+
+exit 0
-- 
2.53.0


