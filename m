Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF28606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=23ROFntg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BH0aXYej
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h9Hto31Ei8twsoteptDahJHqXFA5GSu7dTamilsJIHo=; b=23ROFntgHgJRIo2AfDwriDz/be
	z0hGsED6gV0zbAwcRRYHXO+4qlbjcKkTaGkEVcqd8U1S4zCZ6uT9Y1kK3rBnaqOz7sDC97vW+UqCh
	G1C9V2o/bA3unPtAspJGiORkh8e0mwnOcib2yo4ib3bWMTfuK/e0hrK51a3UnuvVinR26jkuo1gJ+
	jg8XsK66kOtM6ZkuQN/Bq87NW6Ma56IzyvQYQ7hk3uWipiw4p4zZYchaMpzZ8oXpvQwVLvQdowAIg
	Nqs5erpTqonFcyZ6MVhoyOrVrN7r8fJmtfcs5/6iOiyJBrTmgUo5vHzA72iK+S4Y2SOeEkTZ2DubM
	QCt1504Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4BJ-00000008MS5-0bSW;
	Wed, 25 Nov 2026 04:00:29 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4BD-00000008MRD-00Ux
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:00:28 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1b546061d58so11951692c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579222; x=1796184022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9Hto31Ei8twsoteptDahJHqXFA5GSu7dTamilsJIHo=;
        b=BH0aXYej47ORbnd0MJC11NfTxHcBepcOAAA/O9LueD/OhGvuicQMvdeOeBGHGRELZQ
         4Ai2EEVUD9rHXbYQ4ExbD2f6+djLApO1oIAv8EKU7mbeO1F17+mW1blgBHH0iYfhbDG4
         W/LW2T49qdOJxb03+LNEJmBBUP+mY/PGLxFdr5KJsmS+6Fn7wNRhCH9GBsILQhtEX5wM
         ecibDVYRz4FB2ODHKHb/E3F4OVG7zIHlpMqaDCDCfwqYOuSYpY72JMMfpGtBDyZjRqF1
         TGCRvRokFE3o5ECSw5yF8slJ2KeIEvZI1ZPzrcYeI+joF9soLYXHgyZoaenP7aBleZhF
         ky1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579222; x=1796184022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9Hto31Ei8twsoteptDahJHqXFA5GSu7dTamilsJIHo=;
        b=kbX2w/778P1c/C0t5hTGevIFbG+p+PsWiZV5TDF6/kFQmkOwM1oFJIl93qgl5WIKGf
         4Q+tl+IFs5i1r7XgIeuPvl5qVUNI4GMjZyyUNGV0h1HC6oExeMPztKXZCpUBz8Rs8CNF
         N9KODrEfr0/7UMxURSqTVkp0SCYjf0zpsGUKKGOkZFNDaWcZgOYfMNQlpE+oe1vlG7Qc
         ZI/xV9+mBSdiK0KTLXkR3mzMqw9R9O7qQ0L4fOxA0/GE4sqro5vl+lX3C4ZbNTbLWVTG
         KU5SiLIhyGmimo11Ri2SDNZGUdo6UyvyNWRiqJpmz0ch+MUIBM3udJ4FupJyPXsrbNCw
         kbxg==
X-Forwarded-Encrypted: i=1; AL+hErH8LG5ZjLAclXUJkmjvUrX8jlBtenA0NeUS18MC16eyJ4tgJWmfIaBYzn5MDKcFTBr+6NAUD0qu4/DdsT7b0hmj@lists.infradead.org
X-Gm-Message-State: APuU4Z/OSCiPgNOuevOrDDJEVbbNDc90Gi7X6cUO66xEOz4G+gTBabC6
	FlHoZxM8WxaDLStc135ku9WpaNJz8m4hUmS6E7caT9Jki5jPVi5UuyqH
X-Gm-Gg: AZFdTZegpVGWZqfujDc9/HHybIy3LjkHNTeyRB0zhsMme7IHYFTB/tRAWCq1S2kkICv
	GNBas1oYmTSHwhkfWetFSZAbelj8jVm+ESld0j8xouVfRmhBWVtUxnOuO+jMeCUCYJNs1NajIvd
	N2CwX0gQ3IWi3Y4vxAQPbvW8AEOEPodRjHDpkXRm8xllFc3aruUXLFgVEsxbDzwnLFePH2GN6G2
	wF7ZpKG2pMJgEEvTY8RvwQLyOYJgESuxZ9P5YX1H39U6Ndj3sn6Vz3ZQujy1vrBx3+XyP2sm2QN
	WrkbSlW0EuXIZtbw1VqWOC8r6RaWzgf6FRDubAmNz20uQIrwDhwMz9kvWps4qqbX8P+Gec/26l1
	Zq4RQoJtqP1LxEzQk7ABxD1ZrqN5mBLgMdSOgbF6jvqPKKDLDCWiE/jIiKrj0JrbOoZQ01CAftQ
	mtxllU5uIxvRqeN/Sa/SJ6UnFbPHHlvx2zOfaS7crzaUuDDxY2p6Mz+5htzkX+Ro6kHbW3mj79x
	lIFfXblnqUerZPWZY/iUtc3MhALAmPrHD3mPu6JbUx/wWJC3b/34rZkxO2L4QRM+0Yr+r5lwHnB
	Wm2W5+z3bHvVEuFbV9sK6ymF/nnngsdGV4chYofMXw==
X-Received: by 2002:a05:7022:f50b:b0:1b5:2de3:bcfb with SMTP id a92af1059eb24-1b5568ee8famr18413134c88.25.1795579221616;
        Tue, 24 Nov 2026 20:00:21 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm57094127c88.14.2026.11.24.20.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:00:21 -0800 (PST)
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
Subject: [PATCH v13 0/2] perf jevents: Reject unknown keys in the JSON tables
Date: Wed, 25 Nov 2026 04:00:14 +0000
Message-ID: <20261125040016.1675748-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_200023_626513_517D49A9 
X-CRM114-Status: GOOD (  14.81  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rebased onto perf-tools-next, as Namhyung asked.  This is v13.

The rebase drops the AMD hunks from 1/2: they are already in
perf-tools-next as commit edd09316bd37 ("perf vendor events amd: Fix a
misspelled JSON key").  So 1/2 now touches only the arm64 file, and its
message no longer claims to carry the AMD half.  1/2 now fixes the 16
AmpereOneX entries that spell PublicDescription as "PublicDescrition";
Ilkka has acked the patch, which is not yet in perf-tools-next.

2/2 cannot land on a tree that still carries those 16 keys: the new check
fails an arm64 build on them, so 1/2 comes first.

The diff of 2/2 is unchanged: two hunks in jevents.py (_valid_keys and the
check in JsonEvent.__init__) and jevents_bad_key.sh, which checks the
failing case only.  (metricgroups.json is a plain dictionary of group names
and is not checked.)  Its message now describes the test and carries
James's Reviewed-by from the v12 posting.

Measured on the rebased pair, on top of perf-tools-next (148690b95cc4):

  - make -C tools/perf -j2 NO_PYLINT=1 exits 0
  - jevents.py over arm64, x86, powerpc, s390 and riscv each exits 0
  - jevents_bad_key.sh exits 0: NotAKey in a table makes the generator
    exit 1, with "Exception processing <path>" on stdout and a traceback
    ending in "ValueError: Unknown keys: ['NotAKey']"
  - grep for PublicDescrition and BriefDescript6ion over
    tools/perf/pmu-events/arch/ finds nothing

Changes since v12:

  - rebased onto perf-tools-next (Namhyung)
  - 1/2 no longer carries the AMD hunks, which are in that tree already,
    and its message says so
  - 2/2's diff is unchanged: same as v12 (patch-id 8be9ac914f80), but its
    message now describes jevents_bad_key.sh and carries James's
    Reviewed-by
  - the measurements above were redone on the new base

v12 was posted at
https://lore.kernel.org/linux-perf-users/20261120134252.1036963-1-takano32@gmail.com/
The rebase request:
https://lore.kernel.org/linux-perf-users/awTB4cryDW4H4no7@google.com/

TAKANO Mitsuhiro (2):
  perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription
    keys
  perf jevents: Fail the build on a key the tables may not carry

 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 ++++++------
 tools/perf/pmu-events/jevents.py              | 24 +++++++++
 tools/perf/tests/shell/jevents_bad_key.sh     | 52 +++++++++++++++++++
 3 files changed, 92 insertions(+), 16 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh


base-commit: 148690b95cc425950dbba79d73eb4f7938347fce
-- 
2.53.0


