Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WzFmPh7P;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rykkvg+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2QRp2G+wGJdFdnayUAn4UkhECjTnmy5byUMtpzcdPMg=; b=WzFmPh7PCRKQ0e
	nOZbAjeXHCvVflyevK4WDzCj9cc5oZFN7idcP5yxJp8vLrRb45CC8OsMTiNejAB4I+I+EEwivyzNx
	t2l54Z0cZWKkKDnxSu738ET4O1795ZssnFX0EEbC9MwQX0CaRQO9hl1ZbQOTgQ6CrjkcxNAFcmN02
	/pFN1fmxc0iJytb3vQ4hi08eViSEwiG7Ms53YF79mN6//JRnT6cwpFMicexbtue7EyflC1R37VZT9
	YPlsxec8fkdfYVWSgHrh9VAmsWxg45fmBBS02J0SsEWjEYxj3QkHeifEFAJd7TZEBIRn5iNgavokO
	CKvLSLl+brYNuGpuAM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2vd-00000008FJq-0mOd;
	Wed, 25 Nov 2026 02:40:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2vb-00000008FJh-34g7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2010B410D1;
	Wed, 25 Nov 2026 02:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FA61F000CA;
	Wed, 25 Nov 2026 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795574410;
	bh=2QRp2G+wGJdFdnayUAn4UkhECjTnmy5byUMtpzcdPMg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Rykkvg+4zJAAyLxQQRAbqKda4N0bB9ssw/Rt9ZYsq8BMqItzs4sSt3TU/gX3JAmhR
	 gHpMe6DKrz2hSc6hVnjSQObndiYswN3ORqst5F1S3NGXrsKNMny0Ln5KeMKAa+yJiX
	 d2ihyAMgb7kYMlNLGN3iZmMlj0hhaCRul4CewMPqEUkqC1Gx7oxxm6QXrOhEPyTGIX
	 GL/tnsX2IkT/cHlvfzOhh75Wme7z4GTk1w7h5hCM7tqvXO3Tz7WR5QP56Ufo+NwKvz
	 dWI35s8xjS/7vRIzuhZogNEudz6kXDqsqA2nkztgPxNwelWqsWwoZG63otzH6EYLt+
	 cUPvU6tP8MStA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7749D3808209;
	Wed, 25 Nov 2026 02:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: eic7700: Use
 syscon_regmap_lookup_by_phandle_args
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179557440902.178200.2476028983482172628.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 02:40:09 +0000
References: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
by Willem de Bruijn <willemb@google.com>:

On Sat, 21 Nov 2026 18:07:54 +0100 you wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors of missing individual
> syscon arguments, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.  OTOH,
> syscon_regmap_lookup_by_phandle_args() already handles error case if the
> number of arguments is too low, thus switch is safe.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: eic7700: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/882f4ba39863

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



