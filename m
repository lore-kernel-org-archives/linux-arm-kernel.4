Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qG9CKAQO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCyGvlms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JHAmRX/r0jGQ38tK1sD0aSaAzLRfe9WNovc4CDTshWQ=; b=qG9CKAQOx/Pf5q
	CGU2zN+KX50wIyuHZKFmiWKPWVradqNPinbQt87j8iNWucJ/4IhhgZs+Dr4ERzCmzv0pZO1JCYXGJ
	9uZIb7tHF48j0uyC0FiUw2h0v+GjVnCU5/8KUwJrAe8QfzsdHxQC41YfhPMAyjijM4aSMjcFrkbBD
	qzhRRcjHz9/Az0xaVFhEJ1PmlXCxRyNAWGzWA8aQjwokBnMYvYnxxPaECB8tkL0xkRh0xZN8baPxE
	d0rW+QfyKURatpEtx+4HIKiIqkfz/eSNbECVw0S5QRvrOCqBUgtOJXT5EbHMa+WXqqcsTc51R/jLv
	V2aH19aSeEG9lY4eg8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4BY-00000008MVA-2WcW;
	Wed, 25 Nov 2026 04:00:44 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4BK-00000008MSJ-0w3o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:00:31 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-15ea896ddc8so8894419c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579229; x=1796184029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHAmRX/r0jGQ38tK1sD0aSaAzLRfe9WNovc4CDTshWQ=;
        b=xCyGvlmsMKb+ur3HHdDYSGz9Nxpq2Pk7njAkcbpwhg9ryDm4kelRydl7ORC/g94Iyz
         u9dAnu37/jXL73R2rux1pV2V2PwVr2f4k5hxlCgRPHtL+P+Ejk3oPqarPfm4dTI8Boui
         T19DsqEYsEThQqhVOBiPm8Ph8F5rM4N8jNL+qin/oApnP0cer7DkVxHNQ2kz4fLKdhID
         /q8hY36DH9pMdl3qmjexwZQK7QYeviuI7fql1eheN7g47I6VKaTo8btRFyTiLZxxKNF+
         ZJh9X903+W0OClaRomMkj5RwU1hAlYuXx9x6F5tHbCljrBud3HGqVO3HreWBMOB0U9EZ
         8P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579229; x=1796184029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHAmRX/r0jGQ38tK1sD0aSaAzLRfe9WNovc4CDTshWQ=;
        b=TnB+b3KJttP5fTOgUwPGOA8uQ9bNls9XDaZXHzc2mnEDBjZQm5Owl9WT4kfdRKe12V
         Wt7wAAw+I9mJVicrzra2bydNLDp5P5MtwkpdyTqJ2NdZxYEkEOd12byQketfBM3Bo8du
         OJXttKzmF8zCb5BYnMssg/Tl/fI7mi2HzZySSjQ4FNxYlz3BMwtwCi3JKdzLFOvb3FDT
         /yc9EmeGMmSt1CiHSXkJRRlk2gALOsqltJJp5XwdhbjmOXRViZKAo3bIh3rqSr3PEgco
         X+R3iQC/CgE3gpsJniUMdFvxMp3sl8dO+3+XFIv49fYBowx9GFaaloweK+46qZPdYv2R
         HhVQ==
X-Forwarded-Encrypted: i=1; AL+hErFSfigKxIIBo+XxmHD942UzsXwf56nyt5ksmEp7A9tu0EETRI8/OUvqel7LXFzuE0/WzdPTT6h7Kch8/9E5K12+@lists.infradead.org
X-Gm-Message-State: APuU4Z+C5AKU6yz+DgRsMzPHWxSI7YGYlhK0LdJjg3tuMg3DOi9zZgu3
	SQEEZhaNuF7NfQTy04Y/h/SGySPWPR9ABWaaeD53B5Sw7K9W5qCvYnka
X-Gm-Gg: AZFdTZemLuyo2yXiOXynBGPsczeC1x6njSDAtSTC++XMy9W1Fv1J6pt02mkATgX5kb8
	o7ZY6ff41pvJw1wUtCa5QXUxbNI+CIrimL4pbaIQWPRc57wfijlac3sKFVWwHdcqftMdwBhrlaV
	gBZIdN/dhdCgcytgJEMOkVrd/blq67hb9MVS0R4ZWrO1r+wKsssYdOvduabBi7DRCGGerzl9QNK
	a38ZCI3GA5cCYKp761GO6JxcixQ6vfAY9atex8UyiOkc8uVkW9T0g8RN48TQcI1CpQKq8ymGftI
	4qnI6cnb5laIcjhg+z9dIQdTTeLXpFKfOJlvjWr8dr7dTkTIaTwObYxHnxi8y/m3snaxC0e/h4Z
	QI4du8PqGGH4Bwgbq3k0t2uMDdwCqzrApwsXBaZODqxhTz4xSNMTC7rNI5Sbr8lLtRDZQtlICCv
	2bHDqLH2Yg6o4nohxZI5IKj3Ds+9eLR3vQ7Kj1KWumnpTOwXRTjKw2mGXt937gL85k6lBrs9OnJ
	irRNEuR9nJyv+hpoeasLaOpMxsnYh4+EYlh2wpSWalPrmzsVGAxiUgZ3VDTet/syvJPTFxIgt8W
	NgCq3aFUt/78snbG9Q1tqTjN8H800ASXnUEuEUseKA==
X-Received: by 2002:a05:7022:2218:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b57da14988mr6075197c88.1.1795579227824;
        Tue, 24 Nov 2026 20:00:27 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm57094127c88.14.2026.11.24.20.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:00:27 -0800 (PST)
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
Subject: [PATCH v13 2/2] perf jevents: Fail the build on a key the tables may not carry
Date: Wed, 25 Nov 2026 04:00:16 +0000
Message-ID: <20261125040016.1675748-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125040016.1675748-1-takano32@gmail.com>
References: <20261125040016.1675748-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_200030_591513_E46AC3FC 
X-CRM114-Status: GOOD (  22.41  )
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

A shell test, jevents_bad_key.sh, puts a key the tables may not carry
into a table and checks that the generator fails and names the file and
the key.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator on every arch directory, with and without a key the
tables may not carry.

Reviewed-by: James Clark <james.clark@linaro.org>
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


