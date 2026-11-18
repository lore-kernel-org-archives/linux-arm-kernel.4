Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2E260A261B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5FmDMqbq;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V/9RGY9U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iyz12xtbU90FsJpLymbYPQjt0B7C+A1RErrcfWx+fUo=; b=5FmDMqbqRN5Mqs0LtjD8PgObpe
	pJmgDGCyeVn//pWk04KFVJgg7btYIwEpz6G4cIn8zyrp3cENBwwnkGIL5803FzxdT2oPHKDCqaSLd
	qX2bTqm7EoOjnbWjMF/zvVwrDwECff7JLQk+z4WeUv87X0GANC6DB9cMfYy8cU/NQaSz9CjIFSTcr
	ng6isKhzRFyv04vCW9VGyw/r3IWH34Kvfs/cWlp1ELL9Cw+xUjjPFJe6sI5Wbj7H1BkQU/fOBWqJz
	sdRMucNFO82wrYoDYlHyBQG0rvL5dapuEWhSQ5KBoIwcoHDAtekvnADTzBeFfF8UnLX+IR6FepfVr
	OuBbsVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXi-00000009U0Q-1bKD;
	Wed, 18 Nov 2026 16:29:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXf-00000009TyH-01Ah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so832110f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019388; x=1795624188; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iyz12xtbU90FsJpLymbYPQjt0B7C+A1RErrcfWx+fUo=;
        b=V/9RGY9UM2BkrVvyfTvS/BX42Fld98Uwdv2qbPdPnmVsKBZVVDGv5c1WYpGGBj0D8n
         FScisAqWDCjG2Qz0qNZXDnpPJ+UDt42izafISNRvPEeVn7nJ0GwefQ4hb5xz4z7ArY4O
         r6oCEoxEH3D6hiZ/0CGxOv4Qo4Qdu6muGCAKwd4WZZ8LIzDibueHAghAAKxiF+lLpVPo
         uukGIgZbOXSgFfH4zreqCEjG07maYDlIzgnkwWA4xKZYNls5lwhOSEcu7YhckPDueTHp
         3WGK7XJRsuJX2hTGAaEsv3QKhvtWk2iS0jQscGv5b/vZYB786N5xJ9aBe0a3ol7jQfDF
         zIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019388; x=1795624188;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iyz12xtbU90FsJpLymbYPQjt0B7C+A1RErrcfWx+fUo=;
        b=SkCPFwPHL3Yv0+Wk0hnGZTpFb8SeQWRozcmurztlNXSYxDD4ai6SoREAMapxq22gJe
         oBfDtKMYtHuEe/5jjzChE9FC+8znKOHVhjuK7EIrx8orYosMxzm7D0gqY6MDlieK1pIx
         q3SE1dOFicj6u3IVjzOuGwoYvoY2hZulIu+GMaFmNIFYciRNJkEyeW4GgLonrdaapgye
         xPuL1/T76+389S1Osc2gdRXoIj4GdXd0GV5+8ct9FlVbBF89GtRX8qRhMBKYbmsnTz4i
         I4PdCuvAT+uz9UhXOmcv/QlZAfOrfY9Em4Q45jO8N9S7Z4znS4Hs6Tf9M/oXN+57wNA8
         p6Dw==
X-Forwarded-Encrypted: i=1; AL+hErHvMLiS5GVpgCuO6OQa8ylUuTTzNXTB0/r/R8hl0L3wRGmYlScLgIq8NU+w+KNz3BQGD1DKB8Qh9cB9ayZJqxLI@lists.infradead.org
X-Gm-Message-State: APuU4Z+U9EfQd4o7LybhuIe1b1s2eNezJtv8pIdZxgW5f5y72mGjEez3
	HcPFbObfP/vTp3R5HCleSSv98zKFGTjIufh+Zuc2NpVj4SlTAVQqGMqQ5KE4yyLkx5k=
X-Gm-Gg: AZFdTZe61LdZv2jt1/02WLfnmJ8teSuyP7eTB44oVgG28EY5mvRo7WYSi39VdgjXhJl
	b8GblsOzHk6CFl+me8Eyq4PT4oaS4TQbLWedrCD+xQA1+eGJYXL0Vjex1JTuJR+IqRwVEd5XypU
	spQ1YjTlvI4aBUJX8+rBCmQ7o5RBGDuiqjLeGvTfqVLCLtLHWruzlZ2LC68WVO8YIdHr79iSTy3
	/LnNK3AAxMfp+PKyuyaOsRneqYRkxk2Qw7CijAm9MNPBx6jHSNsa2o5rqFdjStG+Sx49l40GQmR
	1ww+ngnEH9Oql6yne1KCFJ8lPmLyBxeMgMKE0LO8yfJLI7C30GVBn67xYKzN547knh7d3MQcYs2
	i0gyNLLiglY3uenaqT4f5N4IJ7JhDiNHELOa8tENovodLub3l2pqWbISSXx2YNysVKY0L5m5DnY
	inH6Gy4YDXZQuQGkrhOg6RzuU/WfxCmHPH+aKrKmVQc5vhS5xMNl7V6QrgcZRdbocIacwPhu3Qg
	09JA5ijfv0ol7Gj8zWWWdZZOHq0D5dMBbdJIZhbvxmpGOggfgubPkzmrPsDsasnbhkm/XnKfOIl
	So26N9bjQHnE6xjbEUUsaJk5iFNF0hsI
X-Received: by 2002:a5d:5d01:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-4a63658254amr7372877f8f.5.1795019387957;
        Wed, 18 Nov 2026 08:29:47 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 00/34] perf cs-etm: JIT decoding support
Date: Wed, 18 Nov 2026 16:29:22 +0000
Message-Id: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPS/WoC/zWOQW7DIBBFr2Kx7lQDhjpYVZR7VFlgGGys2KSAo
 0pR7l6ctMsn/Xlv7ixTCpRZ39xZolvIIa4V+FvD7GTWkSC4ykyg+MCDkDCbhTLYmCiHcSowhwJ
 Coee6RU2tYvXymsiHn6f16/zivA0z2bKr/haJvreaK68Zq9Zsnrm++dxrnKP6r2XYVh/TYkohB
 1dKUKZExkHNwE0CQtcpTWhJSKlPl7CaFN9jGo97bDCZ6sfLEkrfDJ33HAftHNmDM51qUVqJnqQ
 ZPCeSXns0smXnx+MXuTt/sR4BAAA=
X-Change-ID: 20260824-james-coresight-jit-250f19309e35
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
X-CRM114-CacheID: sfid-20261118_082951_118260_65D261F5 
X-CRM114-Status: GOOD (  19.49  )
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

Restructure the Coresight decoder to decode trace in order with the Perf
events. This improves decoding accuracy all workloads, but particularly
with JIT code when instructions at the same addresses are re-written.

The resulting decode loop structure is simplified to
cs_etm__insert_heap() and cs_etm__pop_heap(), which work in the same way
for all of the timeless/per-thread/per-cpu etc modes.

For every Perf event, we pop from the heap while the packet's timestamps
are before the current Perf event. When a packet is popped, the next
packet is decoded and re-inserted.

The same path works for timeless mode because we can just assign the
timestamp of the AUX record to all trace from that buffer. This also
improves timeless decoding accuracy because now we don't use the
timestamp from the very last AUX record for all samples.

In Coresight trace, timestamps come after their associated atoms and
Perf uses a single decoder for both searching forwards for a timestamp
and decoding. It does this by caching decoded packets into
packet_buffer[] and replaying them once a timestamp is received.
Unfortunately this does't work for strict ordering with Perf events
because while searching for the timestamp the decoder will decode trace
using previously seen mmap which is incorrect.

To fix this, add a "packet only" decoder for each queue. This is used
for searching for the next timestamp after a discontinuity and not for
decoding trace. Once it's found, the backend re-orders that timestamp
and the previous packet before delivering them to the frontend so that
we can be at the correct Perf event before processing context packets or
ranges. Excluding the tests, this patchset results in similar total
lines of code but if we updated OpenCSD to return timestamps and
discontinuities in the correct order, then it would be a significant
reduction in code and complexity.

This series depends on https://lore.kernel.org/linux-perf-users/20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org/

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (34):
      perf jit: Support JITDUMP_USE_ARCH_TIMESTAMP on arm64
      perf jit: Add name of clock in error message
      perf jit: Add address ranges to DWARF compilation units
      perf libdw: Don't look up the module by ELF address
      perf cs-etm: Use the exception level to tell kernel from user
      perf cs-etm: Don't read past the end of the map
      perf build-id: Cache the vDSO in build ID mmap mode
      perf cs-etm: arm-spe: Use arch timestamp in HW tracers
      perf cs-etm: arm-spe: Report error if default clock isn't used
      perf cs-etm: Remove old pipe mode support
      perf cs-etm: Track threads in timeless mode
      perf cs-etm: Track sched out events
      perf cs-etm: Handle PERF_RECORD_SWITCH events
      perf cs-etm: Always enable Perf event timestamps
      perf cs-etm: Use time from Perf samples
      perf cs-etm: Don't buffer non-timestamped packets
      perf cs-etm: Decode in order of Perf samples
      perf cs-etm: Don't special case per-thread mode
      perf cs-etm: Decode one packet at a time and don't estimate timestamps
      perf cs-etm: Remove the decoded packet ring buffer
      perf cs-etm: Fold packet state into the trace ID queue
      perf cs-etm: Rename trace ID queues to trace ID contexts
      perf cs-etm: Rename tidq variables to tidc
      perf cs-etm: Share the thread ctxt between frontend and backend
      perf cs-etm: Consume each OpenCSD packet immediately
      perf cs-etm: Split base and packet decoder state
      perf cs-etm: Add packet-only timestamp decoder ops
      perf cs-etm: Create timestamp decoders
      perf cs-etm: Find timestamps by searching ahead
      perf cs-etm: Invalidate OpenCSD's cache on MMAPs
      perf test cs-etm: Add a Java JIT source-line test
      perf test cs-etm: Test trace is ordered with context switch records
      perf test cs-etm: Test decoding of kernel modules
      perf test cs-etm: Add an HHVM JIT call stack test

 tools/perf/Makefile.perf                           |    4 +-
 tools/perf/arch/arm/util/cs-etm.c                  |   21 +-
 tools/perf/arch/arm64/util/arm-spe.c               |   11 +
 tools/perf/jvmti/jvmti_agent.c                     |    5 +
 tools/perf/tests/genelf.c                          |   70 +-
 .../tests/shell/coresight/context_switch_thread.sh |   20 +-
 tools/perf/tests/shell/coresight/hhvm-jit.sh       |   89 ++
 tools/perf/tests/shell/coresight/java-jit.sh       |   65 +
 tools/perf/tests/shell/coresight/kernel_module.sh  |   54 +
 tools/perf/tests/shell/coresight/lib/PerfJit.java  |   82 ++
 tools/perf/tests/shell/coresight/per-thread.sh     |   45 +-
 tools/perf/tests/workloads/jitdump.c               |    7 +-
 tools/perf/util/auxtrace.h                         |    2 +
 tools/perf/util/build-id.c                         |   12 +
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  790 ++++++----
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h    |   28 +-
 tools/perf/util/cs-etm.c                           | 1515 ++++++++------------
 tools/perf/util/cs-etm.h                           |   56 +-
 tools/perf/util/genelf.c                           |    2 +-
 tools/perf/util/genelf.h                           |    3 +-
 tools/perf/util/genelf_debug.c                     |   22 +-
 tools/perf/util/jitdump.c                          |    2 +-
 tools/perf/util/libdw.c                            |   16 +-
 23 files changed, 1643 insertions(+), 1278 deletions(-)
---
base-commit: b7ff10b9ddec8da75304c40fe4abf1ee4f9f0a43
change-id: 20260824-james-coresight-jit-250f19309e35
prerequisite-message-id: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
prerequisite-patch-id: 9c49b9ffb75309e9187eb2e3ef84026118fcfdb5
prerequisite-patch-id: 4ce0ba0ab1302c9043f0d0734d9cf6a35298bc47
prerequisite-patch-id: 5e69770fbaf94296da5c474ce09539a1993bc61e
prerequisite-patch-id: 41d797af2aba7e97ff4435ae2659629e026d36ec
prerequisite-patch-id: d5f67b3b704f4f4b3d9e39c4299d13a086b29363
prerequisite-patch-id: a99348cc2065af31840f652286f840f23395892f
prerequisite-patch-id: aa90408e69dedf9e68d7158f2499bd9fbc7b0b40
prerequisite-patch-id: cd31a650f8dd3e7a9795fa641eee2415b126ad29
prerequisite-patch-id: 922a7fe2937a575beb8d0e7777fd869a11023eb2
prerequisite-patch-id: b0436630e22fd92803e277cd08d782c50f135be6
prerequisite-patch-id: e136ff402ddf5121c63c1393b7fc00a826f60a69
prerequisite-patch-id: 8a2674fa45e40848742e8b8472003e2b9706211d
prerequisite-patch-id: df905386a100ac4b8b047328de08da86b3adf241
prerequisite-patch-id: 44ee88eeafd54c0148ed2332dc5e33f1ba6dfce4
prerequisite-patch-id: b9622164f99682ca6b813b9d38ced3e95170653e
prerequisite-patch-id: 2f22df1738caf5af3a631851d8a57fc3bfea7742
prerequisite-patch-id: afe679ea285ddc6cd281f697ce504b7a18888999
prerequisite-patch-id: f507254858995051e8e1b96fb9fd95506228c5e6
prerequisite-patch-id: 6fe822580ea330633f8a23260aa7b2c7de834ab3

Best regards,
--  
James Clark <james.clark@linaro.org>


