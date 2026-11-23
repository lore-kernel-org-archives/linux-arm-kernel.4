Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD5606A687
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sP7yfsdT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQ2ti56H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UlzfcXh+CNnxF1/O6sGZNDQpzwhENM9AgD1sdDiZQ0E=; b=sP7yfsdTw6qLmf
	KU29vknVv9pz0cmnldeEwaGKuoGlT2m269HZlYgiTTK2ykRE9Rof45364gDOykdlVE9QrvPds8ebY
	bM1Qt/Nk2m0ujGzlILVH1Bdzqf9WzIjJOHCeDV/9+xd0GL/W5GDMS7dM9BxnlRhQJ9LhsAybcQqOe
	7daNW9L/l5x017MVWDl08AXm8gXlLxP/wvyUFibacuM0nBaFd3a7u+Uxfel9lPH93H0cVM1Mg0MqG
	rSdl0QV2F6x1LhP/EFudOWHAJT0n8yt4x4oX3wWqox6lq8aQxRVt+a7xLGLtmTtFTBJvsLwRIO+4M
	Sm5Ey/H9Xq8DhJ/TUyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRoj-000000034OK-2o3K;
	Mon, 23 Nov 2026 11:02:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRoi-000000034Nj-0LEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:02:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 291FE61820;
	Mon, 23 Nov 2026 11:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409FB1F000C6;
	Mon, 23 Nov 2026 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431754;
	bh=UlzfcXh+CNnxF1/O6sGZNDQpzwhENM9AgD1sdDiZQ0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lQ2ti56HgOLvZQ+snX0qzWOH5X+4cz5JgkTnMpOFB2yLxXsl5Wm3BHMQKwQlBvKZh
	 odc+Xg8v4PoUrHvbGH9J/9w55VbUP1oiRuoahUTNIZDspgiEo0xXPxe9GD5oX2tRhu
	 FxtAz1ZAFWwj8DMNesbqXFvnLu4Aw3XITh8IpI7rlWhxQbubyW6tByt6Mi3BGOVSwQ
	 wWWlN/q5y+GS2TSkG6w9uOKQXl2f07+AQxQEzEVfDP7FYfOoGupmJxxfErczBhJd28
	 qc38rnwyOEkntRjyNb8DlTrmLZPr7gZBqyzSLEOHdgS+XJ62QXZhA76KG5yXg5P6RU
	 7qrZi5m8+e2ag==
Message-ID: <296b2280-f825-446b-b128-f37bc41f1eb3@kernel.org>
Date: Mon, 23 Nov 2026 12:02:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] dmaengine: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Frank Li <Frank.li@oss.nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Frank Li <Frank.Li@kernel.org>, linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261030145901.1393-1-crofts@kernel.org>
 <auS_PrwhMwhc5BNk@SMW015318>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <auS_PrwhMwhc5BNk@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30-Oct-26 17:01, Frank Li wrote:
> On Fri, Oct 30, 2026 at 02:58:58PM +0000, Joshua Crofts wrote:
>> [You don't often get email from crofts@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
>> driver core is now responsible for undoing any
>> pm_runtime_use_autosuspend() calls on driver exit.
>>
>> Remove the redundant function calls.
>>
>> Joshua Crofts (3):
>>   dmaengine: at_xdmac: remove redundant
>>     pm_runtime_dont_use_autosuspend() calls
>>   dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend()
>>     calls
>>   dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend()
>>     calls
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>
>>  drivers/dma/at_xdmac.c     | 2 --
>>  drivers/dma/qcom/bam_dma.c | 1 -
>>  drivers/dma/ti/cppi41.c    | 5 +----
>>  3 files changed, 1 insertion(+), 7 deletions(-)
>>
>>
>> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
>> --
>> 2.47.3
>>

Hi, gentle ping on this series!

-- 
Kind regards,
Joshua Crofts

