Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786360A5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c+tLIzHl;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kzssk+H1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7HY3Xyy42ADU9ACuHgExJQX2qZxHihPnkeqAIQZiRGg=; b=c+tLIzHl+9JIPo
	YZMAeaWwWTyWtm6S95UhD/ezHqF06bu03yoFBziRRtGXESToDiFzdR5JTZH754y3BrFHi+MzU75De
	2w1V4N/qGVQjr9Xdp1jgPLmhmH+qlHhDjJ7H+EKfvVEAiODQy/0Kvq9qhaAwqUxBqN48udZSh8sN5
	mbtfhCx6VS1dZN+dN7nrXKTPzgZ/MWD6w1nc9sw1XyBzYQ4sZJW2hqzk41W/+nsCwlfKNHt7jijt5
	xlfb5bdWFrJ/b6/mKao1V31c+bW0SVtJlgn/hnBtFENILmnAJylmX/0mcAqlL71Js/ijncbw5LKwh
	1zcmm+zN6RmK9/TR+iMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXq-00000009U7E-0s7f;
	Wed, 18 Nov 2026 16:30:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXi-00000009Tzq-3s1q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-492690dd5daso986658f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019392; x=1795624192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HY3Xyy42ADU9ACuHgExJQX2qZxHihPnkeqAIQZiRGg=;
        b=kzssk+H1WLp3QT2HUFVlN2GNuAY20SRcci//Fj3dKA0kV5/jSPmSTMr1f6XEsIvoX0
         19zAdedYoM7AdY+PKYgDrLe5/mgBRkmPlgww3rpOMOwLDL3ALXYzlHjPfdylR2SqDAB1
         YhtPGppIiHYL902Q7wyKB+FXGBb1FwxK/3Lgqx+sk4YKss64YUIQRTVpgrAAFsvzUgxo
         jBbsB04ZeyvPa4TR/ab4dfxfVyjzFEw9I2G3iYgenJYXHha8u1grL7Ii6IC1vy7OMfwy
         ukOqlE+7Pf3TAfM4Wjgsso1Z3k3pioUlHBlI/AbUxO7p+OlLHCgTyNRuCAi8yOQkm0T5
         mQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019392; x=1795624192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HY3Xyy42ADU9ACuHgExJQX2qZxHihPnkeqAIQZiRGg=;
        b=patnaeRBSdhEBSz04KRmHU2Y7HfimYwIRGaXgX2hNWuyc58sdbzZCmkhdWUeeiQR1E
         7tYu+4nnUMUgLqGXNOFL/uHKUNG6oBdmMCJgMJhK1swqzBb5cEo9E4pISMMLBCiTFW9N
         4vNGhB6bqbshy6Orz040kuqZ54bd4gmUqVREYTgGFst9C6t3Jn2Dib3f/zPvaGWXH5TX
         Oq1A8lP1Ffgs/E5endafPl1ATreh+GMoxvRqOSoyKqB+k7/BAaR99KBX1eFx3TKGr7RI
         Gz3FEkt/w1HH+SThGWJ2oRvRqIa7MWqUq+xUikifvmBf5KeUUmFemxFQ3mVyzxK6tulQ
         wDUg==
X-Forwarded-Encrypted: i=1; AL+hErGwrtbMorGGmTUYfy2awNJ+UFTYDeaqwq380Guv2ezHbde1ixJvpBtaeMtuaiEXt/UplPP/qaaU4bLT+RbtaEAZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+WJUsEP7+VIkWjbrIZY3uuvKTHbjX/1xanojjCJWVreDmT5InS
	Ii4h2cKxL6hVjdILmRJVs3M7poiBOj+Ox9Tm4HRMctIX3qJu9uWTElP+6qBsuenwxrQ=
X-Gm-Gg: AZFdTZd0rx0sdsh+C49ex6OPwpqO80Sj0tettrF4Kr8dPNub0tqnHq69hce3XGUSGnp
	LDIwnAPptqLdNRvfycWbXxylM+TXzhuxf16BAOYbKWFz2wJpPLwJl4D5Fp2o6mGYHyAeoNAAYs1
	ptTpuD2LPXwvZZSQYoywY36CDQkakJ1SKP/cuwHaojHcHKT0SkMkFCRQnoDz5qDdMY80ovHIZoT
	Nzzt3fzVynGn+al67wsbzBFms0Jk1f9WNCp3vy43F8D8WA9cEVdb9oCGipAvs7FFTdKAskzEDt7
	me7dPWKKTNj4TxYwdRitfojI3pspLRdOVOZLIiOLbTf5QfpEm13WEt1KDu9hN/9hN9nDHNOEZ/c
	kzFQv8AZUN/itbGrcx6yQ95ivVOyU9yz6qPeeRZHhyFB4XaYg6kDqBfBeVNuoGapt2i0+zeOFph
	8NPED1WHHiyhOTXeG+yjWkz3wpO3up7h5ouKw2UCIk2Gfv6ramjCOTX77yyAAtvZg2mhNimdA+9
	2lvp3K/OTLo0eRhA7Stw0wQJPdE7QZ2ubyop0TVde5WhUY986PsP6FQwK2S1WfDIQjtLJPRsglQ
	5uHi+CI1l9yaO8A442Bf4tIp2x/05sG5
X-Received: by 2002:a05:6000:15c8:b0:4a4:c39a:1d4d with SMTP id ffacd0b85a97d-4a63bea7683mr5023380f8f.52.1795019392133;
        Wed, 18 Nov 2026 08:29:52 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:26 +0000
Subject: [PATCH 04/34] perf libdw: Don't look up the module by ELF address
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-4-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_082955_222588_17C43107 
X-CRM114-Status: GOOD (  16.89  )
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

libdw__addr2line() finds the module with dwfl_addrmodule() using the ELF
address. However, libdw reports modules loaded from disk at a fixed bias
of 0x10000, so any ELF address below that isn't considered to be in the
module. This means that source lines for very small binaries and JIT
files can't be found by libdw.

This used to be hidden by falling back to the next addr2line style, but
now missing information stops the fallback since commit (62d7cdc8d587
"perf libdw: Optimize fallback logic for missing DWARF"). So perf script
fails to show source line for these addresses.

Perf creates a separate Dwfl session for each DSO and only loads that
DSO's file into it, so take the session's only module instead of looking
it up by address to fix the issue.

Fixes: 88c51002d06f ("perf addr2line: Add a libdw implementation")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/libdw.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/libdw.c b/tools/perf/util/libdw.c
index 90767361f485..4f472ff9f1bf 100644
--- a/tools/perf/util/libdw.c
+++ b/tools/perf/util/libdw.c
@@ -164,6 +164,14 @@ static int libdw_a2l_cb(Dwarf_Die *die, void *_args)
 	return DWARF_CB_ABORT;
 }
 
+static int libdw__get_module(Dwfl_Module *mod, void **userdata __maybe_unused,
+			     const char *name __maybe_unused,
+			     Dwarf_Addr base __maybe_unused, void *arg)
+{
+	*(Dwfl_Module **)arg = mod;
+	return DWARF_CB_ABORT;
+}
+
 int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 		     struct dso *dso, bool unwind_inlines,
 		     struct inline_node *node, struct symbol *sym)
@@ -188,7 +196,13 @@ int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 		goto out;
 	}
 
-	mod = dwfl_addrmodule(dwfl, addr);
+	/*
+	 * The session only contains this DSO, but libdw places offline modules
+	 * away from address 0. Take the module directly rather than looking it
+	 * up by an ELF address, which isn't a module address.
+	 */
+	mod = NULL;
+	dwfl_getmodules(dwfl, libdw__get_module, &mod, 0);
 	if (!mod) {
 		ret = 0;
 		goto out;

-- 
2.43.0


