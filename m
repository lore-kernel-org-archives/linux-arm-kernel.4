Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDA606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwRHYESL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AmNRiBJJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OzsuLD70Bqy9kFNPtsWpsCxx675AWX9kxtCDvQjineg=; b=wwRHYESLqjwGA9
	fPJeUBijoc+fWoES20tHe1cbgjF5QuKcX3qCKCJlXksp0zBK3rXwyeQ+IkeNbjXq+AlGaZip0LddE
	ZaYZ/rtMYicyXaLt/3VJaVBxOVHP0enVEjccUAc57yazS+2RpCBXw7X6T5jAXGgw+5FYdREAZTro+
	GMpvtSv/KvEkc6jCluCzvzhE+Uat4SOF1sy52NffXjnO9Km7DHXrS8HSv2Pi+OzjG0I+836ej6XLj
	+fI8NnwXuZAjI2gPF7U7436ALIcTzpVdRsOrtQ2Uh5bXC+ChgOmD6m7xHkcd7EAIjn/hhArJlj9Yu
	TcxMBhZb2Tf1LL9N4lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULU5-0000000EYth-0od0;
	Fri, 20 Nov 2026 10:04:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULU0-0000000EYre-3IkC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:04:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 727C8438FC;
	Fri, 20 Nov 2026 10:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14261F000D2;
	Fri, 20 Nov 2026 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169080;
	bh=OzsuLD70Bqy9kFNPtsWpsCxx675AWX9kxtCDvQjineg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AmNRiBJJWX3oXHJPVx58UZljfrqjYHb6dEUBQZDpcEX6D4jkUmq0d1d73LSyj9vuK
	 b6vBNW2rp5if7WAwOMrkT+6mKLGqn5bwYJiZ5sMg4DvEAO2T988ftCaP5+ohV3J9XZ
	 jkPv+sHgh/F5grNF5ErKcXvgNKDc57vls2un34dHFn5Ut62bXoG/g5bii5WHHrmjXL
	 pSXNYPguKkk0MML94RNNA1tJ+oUztImp0jcRB/+rNiQEMSi7mRjmp39ZdVbBURjgnh
	 vVAopHBIUIukPhpc6Rz3cqLufzdpxfncpLdvE9Ndvp91xBx4zoROuRCfxcXKHjS4Ji
	 lT1EqRWWNdJtw==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
References: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
Subject: Re: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak
 in pm_suspend
Message-Id: <179516907748.54365.16971204267682074561.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:34:37 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 02 Nov 2026 18:44:31 +0800, Xiangwu Lai wrote:
> stm32_mdma_pm_suspend() increments the runtime PM usage counter with
> pm_runtime_resume_and_get(), but when a channel is still enabled it
> returns -EBUSY directly without dropping the reference.  The matching
> pm_runtime_put_sync() only runs on the success path.
> 
> Each failed suspend attempt therefore leaks one runtime PM reference,
> so the device can never runtime suspend afterwards.  Drop the
> reference before returning -EBUSY.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend
      commit: 34c8c2ea213aab7b452df93e5b7547f4459a49e9

Best regards,
-- 
~Vinod



