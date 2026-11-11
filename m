Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1917606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RFB4Qypn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBWx1Dty
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w4a/moomI//Q4/GJuGoC1Aw07wBXEacguu+beA9ZSWc=; b=RFB4QypnoValJ1
	dpCE7VdWYgxU7NyPcP6251lxhnrwdysQlFoEyMwSmQ7ncckII5XKWk07AI2XQwQCyMYZ/XYmmxgPr
	XK/2j+SWrw8/PeQg3/1U/FvN/wHMDhg/nxAsc2A7XkBxdAEGxVqQD1Lkh3m60PmSlRsj9f8x6TMxG
	4c9L3CCBNnhdAYov2ocFQFBexHwy64EMbwvjt2q+53tq/BZnNZclHG8655tLletiQvm632EyYdz9U
	jhRJ/bBitzAFtGwM/M7C48XKYLKFQtrMj1E3QcCGthIv3VqSiuvUTNUuBY+5GDiS9DTLZdgdC/KXy
	Z3mMffaM5EFYxPCQ3iSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDhV-00000007Uhv-2XLm;
	Wed, 11 Nov 2026 19:09:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDhQ-00000007Ugg-0zZp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:09:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B09744780B;
	Wed, 11 Nov 2026 19:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9341F00A14;
	Wed, 11 Nov 2026 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424175;
	bh=w4a/moomI//Q4/GJuGoC1Aw07wBXEacguu+beA9ZSWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aBWx1DtyNh34nv71EemD1KewvqNXjcrW9+fG1Ych9WAkrbPqBd1iu9ZnBdkCF217B
	 2N+Mp0WrpOEaOirmoLBG+9BLsfan5Ib7P/T1e4TnuOWH1C9TL3G5pzvLLWBl4Woli5
	 Xhifkgbn8+ktJEutHD3D/mymx+TOkkZ9Z5uk/bIiLPpTa6Ze93TfAD1FP2KZoCbrU3
	 6YQUD5/iu6CGE8SBFZShBpwIIrVsfALMP9a7kCzEs4+UvLAK0D67cmVg0uFC4pF9lh
	 zCU4LlS/PBegbQB8Tb+3vm2DW/lms8xo9pu/oXMHBL4sJy2DQILCXqsQ8juWkADzGf
	 n5GoKB7YVoOmQ==
From: Namhyung Kim <namhyung@kernel.org>
To: linux-perf-users@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>, 
 James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
In-Reply-To: <20261107022145.1713159-1-takano32@gmail.com>
References: <20261107022145.1713159-1-takano32@gmail.com>
Subject: Re: [PATCH v3] perf vendor events arm64 AmpereOneX: Deprecate
 BPU_FLUSH_MEM_FAULT
Message-Id: <179442417490.676192.16502569583148059552.b4-ty@b4>
Date: Wed, 11 Nov 2026 11:09:34 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 07 Nov 2026 02:21:45 +0000, TAKANO Mitsuhiro wrote:
> AmpereOne named event 0x121 BPU_FLUSH_MEM_FAULT until
> commit 10a149e4b4a9 ("perf vendor events arm64 AmpereOne: Rename
> BPU_FLUSH_MEM_FAULT to GPC_FLUSH_MEM_FAULT") renamed it.  The next patch
> in that series, 16438b652b46, added the AmpereOneX tables with the old
> name in memory.json, so 0x121 carries two names: GPC_FLUSH_MEM_FAULT in
> core-imp-def.json and BPU_FLUSH_MEM_FAULT in memory.json, and the
> default perf list output shows both.  The old name has been in every
> release since v6.8, so removing the name would break anything that
> refers to it.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards
Namhyung



