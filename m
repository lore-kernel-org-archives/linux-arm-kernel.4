Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DBF606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EbIg5HSj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXA0k7n0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RNbJFmZkmePFtzHwV6zWkYa+pCLlN4u6+GmZ4jR2f7c=; b=EbIg5HSj4s0UI4
	LvdQ+KGzIw5THtBpcKBb3rh3vcj7MbpKfQutZh/TUf4x7lfTlvqBgpeGu4Anxp8qS4YymbfdYDnc+
	gDCPBddoQ/aoNG9rEG6r0UyZSjMcdWWogZTD/0F++69/zdPnZ8Rr8H5ungyYzg36Tg3ZPA/enw86i
	z35h+rkxwzwpPjvjG614MglwP+HlbHGHm7pCOrWWDQIK4Bw6iy7G0ZOcpMymy14nNVMR/4hKQzWIJ
	rdjPqOjndOZbHJ35xTZGQ7WRVR+vNneP+8OxXoR9+mAng4Q+GZ0I15DhHkaUers+tmy+R/dxewhcT
	ZOfMFAzzw7TPi25AulRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDhO-00000007UgH-27uz;
	Wed, 11 Nov 2026 19:09:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDhN-00000007UgB-2f4o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:09:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC0D9654C1;
	Wed, 11 Nov 2026 19:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6451F00A0C;
	Wed, 11 Nov 2026 19:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424172;
	bh=RNbJFmZkmePFtzHwV6zWkYa+pCLlN4u6+GmZ4jR2f7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RXA0k7n0M5IN7QMkFeVeuLMiGZjXp57D7LIoGJUif6ewwxIEIxcbBJomSSPg11P0f
	 duVoArBe1Km+orfavhR9mC+UpoGorp7VwvfosAbGc5bIQuOUzAmcq8htDsqyAhsxjB
	 KUQRrrAHVa2PXJjeeheqN6nDyqlPag5OZCYhV+i/CzmTGxnBQ022eyZRAFs1b48dwg
	 3t9m1JNK+kO+OV7vzNr+3hRdq0wIgED9eKUIkO/OQzc7uq2fitqsGtW5VVmyMra5XP
	 r1F77k1VhKVsGdiVNCvO1CfMfKLoY5ARjc3d/xZ3LA+GsVsElorq4lROlCyFQzRre4
	 YW72rWMCqhfHw==
From: Namhyung Kim <namhyung@kernel.org>
To: linux-perf-users@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, 
 Shunsuke Nakamura <nakamura.shun@fujitsu.com>, 
 John Garry <john.garry@linux.dev>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261108184654.3811267-1-takano32@gmail.com>
References: <20261108184654.3811267-1-takano32@gmail.com>
Subject: Re: [PATCH] perf vendor events arm64: Fix typos in event
 descriptions
Message-Id: <179442417182.676192.13202396193475036791.b4-ty@b4>
Date: Wed, 11 Nov 2026 11:09:31 -0800
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

On Sun, 08 Nov 2026 18:46:54 +0000, TAKANO Mitsuhiro wrote:
> Six entries in common-and-microarch.json spell Statistical as "Statisical"
> (the SAMPLE_FEED_* events), and one entry in the Fujitsu a64fx table, the
> L2HWPF_STREAM_PF event, spells prefetcher as "prefecher" in both its
> BriefDescription and its PublicDescription.
> 
> The SAMPLE_FEED_* events are inherited through ArchStdEvent by the
> neoverse-n3, neoverse-v3 and t410 tables, so the misspelling reaches those
> three generated tables.  The a64fx pair appears once, because the long
> description is dropped when it equals the brief one.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards
Namhyung



