Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671EE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XesrLE4/;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u/Gx8aBg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0SVPjoU02fufplg6UCU1lm8OR+hTiBw+cX99Xog7iH4=; b=XesrLE4/wAvZkP
	0cmndHzVu03ko2Yi93t35XuBjay11XYcfHnfQhzsL/6+7eZ/xPlyaarIq5Y0ngULwrnFOjdoy9NfP
	iqCZoqZeUIbCl7uUyhmbDm7wpUfwjqx/KBe3vzy+EvQ91eXpWEgKtA+2Y8vjc9oRHzFd2mFHEoof1
	5UpZ26I7ahN4OXacYsasdptq06grKkf9aGwXpqSg53pgooYztZcS7QDXXbfiwkwBmF4MAjzGZHqvQ
	VNDnb471tAiJc7zVWsOb0YaaRYhBMTMiBOsT27531hWhFJrgL46f54I7HxTSXJwXikMffXJ2a8sjB
	CXAAu9JDnycXUw1+WZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGyD-0000000HJ12-34Qm;
	Mon, 09 Nov 2026 04:27:01 +0000
Received: from out-24.mta1.migadu.com ([95.215.58.24] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGyA-0000000HIyv-1oXW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:27:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0SVPjoU02fufplg6UCU1lm8OR+hTiBw+cX99Xog7iH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794198415; v=1; x=1794803215;
 b=u/Gx8aBgnHUkuXVi2+BQTYcTDxH8zFUmAR/TVFAy46WVUw8Lm9l8nbKAhmANIRo5EFy9lMew
 uqhCIgOleT3njpCY3/Dv7cMDqi4bwx/iXr8FHzCyP+4xEO4rb2Uae+SFRzrmb+HNtjjXKcUWcSf
 Benz8ZX3QBGriDvnxTFBIbfA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b6a087d0e32380d8;
	Mon, 09 Nov 2026 04:26:54 +0000
X-Mizu-Trace-ID: b6a087d0e32380d8
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
Subject: Re: [PATCH v3 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Mon,  9 Nov 2026 12:26:47 +0800
Message-ID: <20261109042647.37323-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-3-songmuchun@bytedance.com>
References: <20261107043122.25650-3-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_202659_113708_04D13301 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, Nov 07, 2026 at 12:31:19PM +0800, Muchun Song wrote:
>Whether the optimized mapping can be used is now decided in the
>architecture-specific vmemmap_populate() path. When PowerPC has to fall
>back, such as on Hash MMU, it can disable optimization for the populated
>vmemmap range there.
>
>Add section_vmemmap_optimization_disable() to centralize this fallback,
>use it in the Hash MMU path, and drop the radix-specific
>vmemmap_can_optimize() override.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

LGTM, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

