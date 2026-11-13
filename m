Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91410606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LtX+dujI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+4sTtT0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SLrfXA00+hH91pGEIcQKSgRYTU7yqxAgPUEz82JzvDg=; b=LtX+dujIVPcOS3
	osDnfMfsxayOn4UVeMvmq8NKm2fBQGtWLkUUVcVsgHRo8rGYy+tOxBRVUSEyUfJadoVJu0RpwvvPz
	rgrpCg/Qpsf4KhMr+I88RRF40G1rfBCQ2F5nQJ5nlrYHVD57TPC8IxrESxl2XO+u7MOYt/A2mLxkC
	RbSDbWoiNxUnXN5i1j8BgvBXHA3Fo23bFt4ohpI49DwDUsYAjHB20emwatK/ZxLmzzL1bsm4BQc71
	NL0Q66HBMJ+aJjwQNsszVXIOWClSZy+UkKmRpx6yr44lnSN5O8SbTdl7HUExbqpWYqapsdgcL12wL
	U9pzk+VMEhN28d/QrH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcX-0000000E5TP-1iil;
	Fri, 13 Nov 2026 19:07:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcW-0000000E5Sw-2dG2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E364962C23;
	Fri, 13 Nov 2026 19:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCDF1F000C4;
	Fri, 13 Nov 2026 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596851;
	bh=SLrfXA00+hH91pGEIcQKSgRYTU7yqxAgPUEz82JzvDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P+4sTtT0Id5ZgijBjq9xYcStIPDQ/YM3sl9szzlfiVjvbWAiwLKz5hL04NpNY1/6R
	 YtANNLpg3qatWMuYqzhMYOdXiokNeck4pRZQbXP7sdYG7HziVvNP3kl+BXuTgF2jJ3
	 uHuBtIZJJZOYOhcZ6K7KzzWjaaGsmtTiMkt0y0XR6kT5SVcHhkWJvnNrylR9QFTCsZ
	 P3gJi71VVj1WqpBQQvLgS5FNSzCrGVzlm7S+R+oxhB0nOZoR7hfyjzfypghVHZPUF1
	 /66/iPsbo8q0JPc6M8RsrmgbtUqmD6rZRjF0G8LNHJJpqNNsSo2cdfNEQXp1y8h+P5
	 SDkfIH5QNrjyQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] arm64: dts: apple: Correct white-space style
Date: Fri, 13 Nov 2026 20:07:18 +0100
Message-ID: <179459682365.12029.5906784319850612479.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185414.183418-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185414.183418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 19:54:15 +0100, Krzysztof Kozlowski wrote:
> Correct minor style issues around white-spaces (e.g. double space before
> '=', missing space before bracket, spaces used for indentation) to fix
> dt-style-check warnings like:
> 
>   t604x-j575-j773.dtsi:27: [mixed-indent-chars] too many space characters in indent (more than 7)
> 
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/1] arm64: dts: apple: Correct white-space style
      https://github.com/AsahiLinux/linux/commit/c769d37ba473

Best regards,
-- 
Sven Peter <sven@kernel.org>


