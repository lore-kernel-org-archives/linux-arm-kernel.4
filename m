Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gdqeSYRl;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MMq0OsFY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JSOyM4K5zrqmDFF61CwIn14s5ShEHbu2alo+0Cxugro=; b=gdqeSYRlZDRyX+
	iHHMoSVQy0HpR/QFeZKBGaxxTvCP7vru5l097NrsMJHMafys9wJNa5OGRVBZw/PAVnCVN/NkljUOu
	CE0B0PFAd5MWYNc38bc+sqm9Z4q/lyz1dh+xITAGC+bVV1mzt6R6NiTtq9IEGxuxnLr3lAL8ArxaS
	+0IWzLzQHAUg6rlLSv93ZeN4FUBNMUZ3URxMVlp3yZDXpVWEtvGcQzT6ymGfaFPFeDt/7FFJEsEDm
	tHLBMfvSLg8Uz6hi4NdDPymdhXY9Ge0wRsAJSqiz+gOdQHX/ZdEYOVNd7syfGVofBN6/ngpQ1fTi0
	NRL7FHD4o+upQYXXP1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIFA-0000000HSJa-3OKz;
	Mon, 09 Nov 2026 05:48:36 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIF5-0000000HSHw-3DlY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:48:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JSOyM4K5zrqmDFF61CwIn14s5ShEHbu2alo+0Cxugro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203309; v=1; x=1794808109;
 b=MMq0OsFYOeDFfLKeanMq/JRW5emG22N+JN82VeucMQQPT+M2lExIrVamS+c7q+asXdJ1pdl2
 1X0kSw1FOEdPQI/obnIvW1WVZJsWlAMtC3SyfA526L1kdBXP241tfsR5N7B2uuz87yZGgwPpUpd
 dE+PwLyiJkXRbdzGAO40uSAY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bae7ce2de6921a50;
	Mon, 09 Nov 2026 05:48:29 +0000
X-Mizu-Trace-ID: bae7ce2de6921a50
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: david@kernel.org,
	maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	muchun.song@linux.dev,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Mon,  9 Nov 2026 13:48:23 +0800
Message-ID: <20261109054823.45056-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-5-songmuchun@bytedance.com>
References: <20261107043122.25650-5-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_214832_303798_AEDDC487 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, Nov 07, 2026 at 12:31:21PM +0800, Muchun Song wrote:
>section_vmemmap_optimizable() can already decide whether a section uses
>vmemmap optimization based on the section compound order. The DAX-specific
>vmemmap_can_optimize() helper duplicates that policy, so remove it to
>simplify the code.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

With the arch fallbacks handled by the previous patches, we can just drop
vmemmap_can_optimize() now ;)

Nothing jumped out at me, so:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

