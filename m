Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE2606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tU1pJlVs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBRw9e2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n8g69Ffy8X8/MidEKWQhACh6qmyitgBHvkPD7FRYFPs=; b=tU1pJlVsLgd1b9
	Dzg216FuigvCiVVQV0vsSDbFp4AmSJ/TYSvSX6xCR/AXFAEwRnXlt6naotyXUrw9Ym2KTmJL5u0Hd
	MCp1aWQZ8a2fg3ht0ZlkmexoZxnKHv6/9ug6CwJHeyvOxqdqyFj4b/Tqf/DtjGxEYms6F0y9nyWSo
	vTtH/izka8gX1TTx9emQA1Zaszm4sQRm0Tu5A08p4g7+lqzljG59Z7FMqdUvfcv2HhS1JLdVPB9sV
	N83GczUaKq4KguHPWEcxv7qq0LXPJho0noinkcfPZ5LaPko3XazMEpF6zK3V1/BjKk6tH8A3GoKc6
	vzYksX1svYIICR2qdDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDhV-00000007Ui9-2wGr;
	Wed, 11 Nov 2026 19:09:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDhR-00000007Ugx-0XI7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:09:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5781663A57;
	Wed, 11 Nov 2026 19:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15021F00ACC;
	Wed, 11 Nov 2026 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424176;
	bh=n8g69Ffy8X8/MidEKWQhACh6qmyitgBHvkPD7FRYFPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aBRw9e2TqfUocSssJ6RZBOTqXpmgachx3SCxgtoXnTNLsA7YxaJKaQmAYnNzUTbyn
	 7dytq2/s9GEEWbgqIiGd8Zn5BsHb5Wd4n/4scnqXTmmxVPZmnoq+zEiSyfXQjQrOdb
	 6YrWdg0gVXJyl2mBqnpcW0hHodlrtNGhAjAbhFXRmmGLbo7px+VjZszKLSMMhZaRlO
	 TGyRtDKB+C5Al+MUagVIClaod10D971df2L0HHZdFcCGHXr/U6mVzkklW1JN0293Dh
	 2Ecr5pPXG75PSSiiTem+vRDpUOYUlNDjUzNZsaFgqASRyl4/ARCOA3Dx2bvZboV92s
	 Q0pZESNlIA6lA==
From: Namhyung Kim <namhyung@kernel.org>
To: linux-perf-users@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>, 
 James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
In-Reply-To: <20261107051730.1880691-1-takano32@gmail.com>
References: <20261107051730.1880691-1-takano32@gmail.com>
Subject: Re: [PATCH] perf vendor events arm64: AmpereOne/AmpereOneX: Fix
 typos
Message-Id: <179442417564.676192.15713798103748970108.b4-ty@b4>
Date: Wed, 11 Nov 2026 11:09:35 -0800
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

On Sat, 07 Nov 2026 05:17:30 +0000, TAKANO Mitsuhiro wrote:
> Three distinct words are misspelled in eight description fields in the
> AmpereOne and AmpereOneX PMU tables: "Preditable" in BPU_BTB_UPDATE
> (AmpereOneX only), "satisified" in LD_FROM_ST_FWD, and "misprediciton"
> in the branch_mispredict metric.  jevents.py copies the strings into the
> generated tables, so perf list prints them and a grep for the correct
> spelling misses the entries.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards
Namhyung



