Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=em2jAuA0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSdNGUDn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4F6U5hwvw8gwNmHBNKQhCDls4ausjqIT8kXPov+zDoA=; b=em2jAuA0HZV0iV
	6m2t6ebgKuhEEFQJsXSbRwj0I1ACbAbaARorZ7eeaFxDq1aYd2y8yQJ4yAKVS1LVIst+83RrftJ0W
	4DNjXuGnAu45UHIfBVTWUVJHAt+zWD7JY6o7z9w++JfNt+TTTsEqNpyggDPnDnrYKm5ebypurBe4i
	ecfgfbL9MjlF2MmBjgV/Dv6lsFlv9Y8QCpeZtNlTkANjSVnWW4bhA1cR29wSmyp4mSIE5G6h0/oBS
	SRTZ7wixly6dLmZy6WW8PSuk6D+xoURP3FkJbOY09W6srv1+HExH785FHIjDGdr4TtpCtuybfkjuD
	Od+MqyFBsw9S9OyRWqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw8r-00000002T5r-2noe;
	Mon, 16 Nov 2026 12:49:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw8q-00000002T4t-0Eyr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:49:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C85C8437C5;
	Mon, 16 Nov 2026 12:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A251F000C4;
	Mon, 16 Nov 2026 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833339;
	bh=4F6U5hwvw8gwNmHBNKQhCDls4ausjqIT8kXPov+zDoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iSdNGUDnUPPi4pJnAYBKNnCGTaI+y4qb3uN/K5lIkcESpOPrpKPgqoRvuRlqXEFp/
	 D22TIAOQoLnM4fj+lgCWae9ef+MQKYOaeqrQgq0dhWWtnjfAThJNwLHjtsfOcC5RbD
	 Np0pFfdb5cSXXXZAUynvQxQrYr1pxZBp6UXANT9o7ZTogMmpoIoohw9lcwxG03mhpX
	 Oy2/oEtzbGj0awkxpXQl7L8affCM3OatgSUKikQvjQ8lVdfzBbeLPTvGwJaiSqc/fS
	 78SKOIgyWd1tcz2HtBmGbx4T2VjGTdAtXLoFfYLGAeU5FNyhXMeNcrhwM2xy6db58r
	 GhZKMPeccyxAg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 03/10] ARM: pxa: support arbitrary PAGE_OFFSET
Date: Mon, 16 Nov 2026 13:48:25 +0100
Message-ID: <20261116124832.662455-4-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116124832.662455-1-arnd@kernel.org>
References: <20261116124832.662455-1-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

The pxa3xx_cpu_pm_suspend() implementation hardcodes the default
PAGE_OFFSET value for CONFIG_VMSPLIT_3G. This has always been broken
for other configurations but becomes much worse now that the default
is changing.

Fix this to use the correct compile-time constant instead.

Reported-by: sashiko-bot@kernel.org
Fixes: c4d1fb627ff3 ("[ARM] pxa: add preliminary suspend/resume code for pxa3xx")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/sashiko-outbox-212719@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/pxa3xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 06c578ea658e..253770075a8b 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -103,7 +103,7 @@ static void pxa3xx_cpu_standby(unsigned int pwrmode)
  */
 static void pxa3xx_cpu_pm_suspend(void)
 {
-	volatile unsigned long *p = (volatile void *)0xc0000000;
+	volatile unsigned long *p = (volatile void *)PAGE_OFFSET;
 	unsigned long saved_data = *p;
 #ifndef CONFIG_IWMMXT
 	u64 acc0;
-- 
2.53.0


