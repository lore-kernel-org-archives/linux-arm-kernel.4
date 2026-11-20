Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048FF606A51C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Md49O43f;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INwmqJ6d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RcHTKgC3tArjDxrWuo6tbizL56S6DluuwiuXlvWfhT0=; b=Md49O43fSbzTQ3
	rewvFKimFJ+r5im4T1JgSJxBfVjDOrfF5aM5zYfa/6SAZ0gI8eBMMzST4kTYrOCUg4Z3/ysSE5zES
	3vmqnpK2SJpzbLyHkrfwCq9S2CoSqBF6vCJKZ+GlDRISNyjxMO6kGZggPwwc/DrCX6QZecHfP9VBn
	L9Rgztxh8dVs8igvAYEOKD1C9ZVcOhn13MnZHE1PuMt2mCf+k8JGvs7Q/AU8WPM8y/Qtvanzx37Ry
	xzqnhRZ6DFJfEutNqmm4FDCSEJlVR3YyQFAr1LSXOa0AjYrxzCc44e255izjUVRWhFQZT1ZqjzaIL
	yU6eUsBwRSKuO0X/rHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHog-0000000E8JK-2pd3;
	Fri, 20 Nov 2026 06:09:46 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHoc-0000000E8IU-3C8m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 06:09:44 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38587f3de36so572545eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 22:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154982; x=1795759782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RcHTKgC3tArjDxrWuo6tbizL56S6DluuwiuXlvWfhT0=;
        b=INwmqJ6d5pzE8jkzToMpUTVcKb5LZeQNMxEOwx8/Fdeu7rMhW9oue9ZDjGlFSGraxT
         nxixTUQ6rq4FZ5z3p4xPXVJm9kL8hIeG/Gx6bz4iH1VJ+DCeL1tHmDX2gG5/OtHNpzmY
         2XvG2GreNHevRnkwW7nPiCPaLnsYvymoV7wvAEhSSulwsstQShamAbyOUAoQVRJBowGb
         1Eve5HpPiQuwRqMUBmQRqKnSUoDHORPmQ+cZTi5G15RWzJdBF83fZnIs7EU9/lhIKAhk
         TboRa2b36AUisLP+bv+FkMjv4HzEeL28MC8mFW0fi4k0aUTGH72lb2Itzi+/HfPYmkGu
         hyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154982; x=1795759782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RcHTKgC3tArjDxrWuo6tbizL56S6DluuwiuXlvWfhT0=;
        b=TeoPrZunsj0KSUi/h2onK5UsXF4Rfak8xOdwNl5OldTNoFln50K6nc1legC+WQ91G4
         nCxLf7HOy+YszMHR7dnWJL9IH4jx57tINgx9+VbQ9Z6NcJkYuechgivHb85CxqC1TqPW
         2GuCaNlQ+P7WKLQU0cdHbtv47kSy9GjwB+LdySsnb8VYsSE2O6sKCUQXhDpk809MSnu2
         tGJRxI58z700/IyFws5WU9tNw12S+Y1xhQNTjiRUvPRPRD/nQvWxXwxa4612VJbjqM6T
         yLdUhoFajehDOhOa7kKEEIDreHvLFFw09NSI6wLTTmIh6hkKKVGyjB/jOSwTIsjt26Vz
         T56A==
X-Forwarded-Encrypted: i=1; AL+hErHxn85rwQGrouM3Y6L23ZSapFYb1V1jnAd3EFIjKmkPntXNks0LkfBIqPok8g8z6+nffiFcIG1VKfiuSLb22MTC@lists.infradead.org
X-Gm-Message-State: APuU4Z+FMbtVSy3fPucV4cRcrIfRzfazUcyBJIw4X/3GLJhPE9QxcBTw
	yzLprbT9s8R7asOVzY7fEaNInn9esTcX49xZhKxvKCJ+tyQZC7gGw9cI
X-Gm-Gg: AZFdTZfXwckjvttf/4sVEh6bNLWVQuuT5StgL0z3baP9ko3kQSuvvbYjH2k1AlsIWPa
	2BaGiYb7o5wOYLSJDi5dcTOMz3J1whs0gpCcxbywhcMpakP8CIPSalOFuQrLUgpfohqSq38O/oN
	yuefb34dbt9+trEnVyk8z0uQ3J6dsfI0JW8DPSXTAL2T+1nxTe1oqejCw1hFbckq6y0ov5MnZxJ
	/8MnFun4YdR20Sz54JchBM2sxGYFYgRJzLHNn3gXJq3AvpoXZC5PH1G1Fs3nwHrRU/Tr3W9D1UZ
	ywWYkyxhaKZwNbFmnaWTvfdVPBxTORgK9Sqgbs8aSyiZQyimZroFz/iCZsdQHZ8InQ1pWX0Xsau
	9Hwbhj/iJivVIQps/M7lqD3QXlTBoxz/D8XLQCbcnTIDZHMMtc1sz0kJzq3OkNAC5RMBq64mL8v
	aawhYp0hkrmQU3A8LP3UnFv3bVB7icdmEtP3ZSd6eucqwLOANWOqzZjYIZFTwNqywzIt24Mks9F
	H4Fm0NvzfOZeFtNlmhqXRLoNwhGOfdnUCEcKPIv/177v9u2a5EYuaesVcRlYtyuM6aIg+yanJHp
	C2vs80xfbXnuBJ8RzXFm
X-Received: by 2002:a05:693c:880d:10b0:380:fd90:e660 with SMTP id 5a478bee46e88-3856f653c9bmr1790201eec.14.1795154981605;
        Thu, 19 Nov 2026 22:09:41 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm4609725eec.21.2026.11.19.22.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:09:41 -0800 (PST)
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
Subject: [PATCH v11 2/2] perf jevents: Fail the build on a key the tables may not carry
Date: Fri, 20 Nov 2026 06:09:31 +0000
Message-ID: <20261120060931.711483-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120060931.711483-1-takano32@gmail.com>
References: <20261113032927.634183-1-takano32@gmail.com>
 <20261120060931.711483-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_220942_843496_5DB895FE 
X-CRM114-Status: GOOD (  24.88  )
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
carry, and fail on anything else.  The error is one line naming the file
and the key:

  jevents.py: <path>: unknown key(s): ['BriefDescript6ion']

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator on every arch directory, with and without a key the
tables may not carry.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/jevents.py          | 70 ++++++++++++++++++-----
 tools/perf/tests/shell/jevents_bad_key.sh | 43 ++++++++++++++
 2 files changed, 98 insertions(+), 15 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..65e51dafd42b 100755
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
+      raise ValueError(f'unknown key(s): {sorted(extra)}')
+
     def llx(x: int) -> str:
       """Convert an int to a string similar to a printf modifier of %#llx."""
       return str(x) if x >= 0 and x < 10 else hex(x)
@@ -459,6 +483,8 @@ def _read_json_events_impl(path: str, topic: str) -> Sequence[JsonEvent]:
   try:
     with open(path, encoding='utf-8') as f:
       events = json.load(f, object_hook=JsonEvent)
+  except ValueError as exc:
+    raise ValueError(f'{path}: {exc}') from exc
   except BaseException:
     print(f"Exception processing {path}")
     raise
@@ -492,6 +518,8 @@ def preprocess_arch_std_files(archpath: str) -> None:
           _arch_std_events[event.name.lower()] = event
         if event.metric_name:
           _arch_std_events[event.metric_name.lower()] = event
+    except ValueError:
+        raise
     except Exception as e:
         raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\'') from e
 
@@ -643,7 +671,10 @@ def preprocess_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
   assert _bcs is not None
   if item.name.endswith('metricgroups.json'):
     with open(item.path, encoding='utf-8') as f:
-      metricgroup_descriptions = json.load(f)
+      try:
+        metricgroup_descriptions = json.load(f)
+      except ValueError as exc:
+        raise ValueError(f'{item.path}: {exc}') from exc
     for mgroup in metricgroup_descriptions:
       assert len(mgroup) > 1, parents
       description = f"{metricgroup_descriptions[mgroup]}\\000"
@@ -1473,6 +1504,8 @@ def main() -> None:
             continue
       try:
         action(parents, item)
+      except ValueError:
+        raise
       except Exception as e:
         raise RuntimeError(f'Action failure for \'{item.name}\' in {parents}') from e
       if item.is_dir():
@@ -1536,20 +1569,27 @@ struct pmu_table_entry {
     if item.is_file() and item.name.endswith('.json') and not item.name.endswith('metricgroups.json'):
       tasks.append((item.path, get_topic(item.name)))
 
-  for arch in archs:
-    arch_path = f'{_args.starting_dir}/{arch}'
-    preprocess_arch_std_files(arch_path)
-    ftw(arch_path, [], collect_json)
-
-  with concurrent.futures.ProcessPoolExecutor(max_workers=_parallel_worker_count(len(tasks)),
-                                              initializer=_init_worker,
-                                              initargs=(_arch_std_events,)) as executor:
-    for path, topic, events in executor.map(_parallel_read_json_events, tasks):
-      _json_cache[(path, topic)] = events
-
-  for arch in archs:
-    arch_path = f'{_args.starting_dir}/{arch}'
-    ftw(arch_path, [], preprocess_one_file)
+  try:
+    for arch in archs:
+      arch_path = f'{_args.starting_dir}/{arch}'
+      preprocess_arch_std_files(arch_path)
+      ftw(arch_path, [], collect_json)
+
+    with concurrent.futures.ProcessPoolExecutor(max_workers=_parallel_worker_count(len(tasks)),
+                                                initializer=_init_worker,
+                                                initargs=(_arch_std_events,)) as executor:
+      for path, topic, events in executor.map(_parallel_read_json_events, tasks):
+        _json_cache[(path, topic)] = events
+
+    for arch in archs:
+      arch_path = f'{_args.starting_dir}/{arch}'
+      ftw(arch_path, [], preprocess_one_file)
+  except ValueError as exc:
+    # A worker's traceback is three levels of ProcessPoolExecutor noise around
+    # the one line that matters, so say it here and stop.  make deletes the
+    # target it failed to build (.DELETE_ON_ERROR), so the next run reads the
+    # JSON again rather than a half-written table.
+    sys.exit(f'jevents.py: {exc}')
 
   assert _bcs is not None
   _bcs.compute()
diff --git a/tools/perf/tests/shell/jevents_bad_key.sh b/tools/perf/tests/shell/jevents_bad_key.sh
new file mode 100755
index 000000000000..7848e60b8b4a
--- /dev/null
+++ b/tools/perf/tests/shell/jevents_bad_key.sh
@@ -0,0 +1,43 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Check jevents.py reports unknown keys as errors (no_mlock)
+#
+# A key that is spelled differently is dropped without a word, so jevents.py
+# compares the keys of each object in a table against the keys it reads and
+# fails on anything else.
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
+    "${tmp}/pmu-events.c" "${tmp}/pmu-events-string.c" 2> "${tmp}/err"; then
+  echo "jevents.py accepted a key it does not read" >&2
+  exit 1
+fi
+grep -qF -- "NotAKey" "${tmp}/err" || {
+  echo "jevents.py failed without naming the key" >&2
+  cat "${tmp}/err" >&2
+  exit 1
+}
+grep -qF -- "${tables}/events.json" "${tmp}/err" || {
+  echo "jevents.py failed without naming the file" >&2
+  cat "${tmp}/err" >&2
+  exit 1
+}
+
+exit 0
-- 
2.53.0


