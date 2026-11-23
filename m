Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FrZmBBTM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePQy81q8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YeKTj8sU3PPVK1jqHNIBn6E0hYZh7ngUgDcVZ2nW3qI=; b=FrZmBBTMrztJee
	x/sEN7AKeC9Ilcs3Vf48xgZaIhtwNUosfC3oGRcw/oZKz2QSxzL0flDKmSWY3b5PGshhXyRiNFyLR
	fjP0is0m4vtrLCQKElSDBd5KM1fRpgbt+eqlLzxym9U6jONX+TZtBcmcICfLExK8QkpBkRGwFYW9b
	cavtjKG6b8wSdkec/CnTsOSMfAbFdooZbVnF+IvwGptEPKDV3b+95cmDy5chV34n11rkkxgifwUSz
	BBMiYq6MNCeuVViFN/liXc5wbvpc7FvIqe8rX0Zh9Bn4pZEe52Mkn5pieT3IQtE2UkAPYVe6BgsGV
	gXersll7qS1v6fDamusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVWg-00000003sUh-2Vn4;
	Mon, 23 Nov 2026 15:00:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVWc-00000003sTX-33px
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:00:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F8A962292;
	Mon, 23 Nov 2026 15:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0D01F000D3;
	Mon, 23 Nov 2026 15:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446009;
	bh=YeKTj8sU3PPVK1jqHNIBn6E0hYZh7ngUgDcVZ2nW3qI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ePQy81q8oFLsSMqmQViHrg3+sOBKvkUC99sl1+PnNaGR6tMcujMT8LkkOUuKAN1QA
	 vy8d9rcf/VcdP1rrhdI9uaTR+Gh/FTJfB3bInhjOYbJtUhkkU3PAW9nX0Vz0STRlw9
	 63MvXgLyghChW36pV2kH/HNI2ddnA7syovuMcq6fc98NjMn0vO75oCXIyPaMAIBT6e
	 yvmBJPk8Xo4k9YvO5TMCuwnaDTAmxzjZSFm2mNxlg9gNHTPKY2vEwEdwlWTKfJfskA
	 H6WhvJj9B4CYJvCc7p0ZIJMlVR9fS0MU56PoBK32THlh1e9ajmilG2VBlTNlRFXedK
	 xzZN8gBWB2VPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4593392EDBC;
	Mon, 23 Nov 2026 15:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: sparx5: check DT port reg against chip
 port
 count
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179544600827.2443681.14423703100229910536.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 15:00:08 +0000
References: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
In-Reply-To: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
To: =?utf-8?b?546L5rWp54S2IDx3YW5naHIyMDI2QG1haWwuemdjbGFiLmVkdS5jbj4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: daniel.machon@microchip.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 14:43:07 +0800 you wrote:
> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> 
> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>     sparx5->ports[config->portno] = spx5_port;
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: sparx5: check DT port reg against chip port count
    https://git.kernel.org/netdev/net-next/c/5a1f67933615

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



