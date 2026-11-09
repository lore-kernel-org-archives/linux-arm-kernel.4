Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BB3606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=boRjs7Af;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4fqi+1r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UULeg7ZwfrRSMBYNdcUvvoEFwdkhBm2Chdood5mPzUk=; b=boRjs7Af60YidbAG+5OWSFw7zR
	Vt1oROzoxJJs+ql425pXbv85vQENlUW6n1G7mlmP8rYd5r5k/CBhjU4PlLgHeSjhCa8zCZfgku7/o
	JWfIaGTmBrcP9SRVS7YIm1C38kVfaO9DQjvGh7wfU0CeOLwKxsaInVK9fAO1zHg0PxGIDVu24uM4p
	ZzwXskwaB9iMcoxhfzpopLhzXHJzE8I/V/iCBHFOc//tWn/kJyhKNc7YoylgOsctKzPM2QcLB8LGi
	U5urfEiUJ98r3wl8V23NLsm9jOFZzHjF1RsShdgDmG26rYzWN+n0ylEZqTNRdZ4IJ9vmjVdAk+EWG
	mya4ROJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPiC-00000000sYf-3H0G;
	Mon, 09 Nov 2026 13:47:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPiB-00000000sYV-1ocp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:47:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA05160D2A;
	Mon,  9 Nov 2026 13:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC601F0089F;
	Mon,  9 Nov 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794232022;
	bh=UULeg7ZwfrRSMBYNdcUvvoEFwdkhBm2Chdood5mPzUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g4fqi+1rJXD8n05eVPt9zgL/1cqFGPO9B3K31Qf8cik24oKlB4uZAmvF7M+JPIhM0
	 kN5PNyYXjxbKyOAH9Vy+Cb4eM/tLTpjkIAo0jaMtmzKqhsFopAUK7mP2HKlmxnPp1Y
	 92SdK2+rS4Lfw/XEAfOJopv477xAuZTtlNgeK1BHgzlioTiwPWhU1uHP9prf9LTnZx
	 40U1F2w6m3bzbM9G1UMao+aK5L4VwlhIoofCylO9NAn1vKMORGTdzHbWDk6ZpcHa87
	 DdIiFp+DeeBiTJvaQ/5029d2on2APuLgV84ikr//xnC0d0sZPE+nfENyrn8fxzlQxv
	 zgH0en+eJ7saw==
Date: Mon, 9 Nov 2026 14:46:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, deller@gmx.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, git@amd.com
Subject: Re: [PATCH 2/2] dt-bindings: xilinx: Remove description for
 framebuffer IP
Message-ID: <20261109-crystal-kangaroo-of-charisma-d7a8fe@quoll>
References: <20261106170902.3656809-1-radhey.shyam.pandey@amd.com>
 <20261106170902.3656809-3-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106170902.3656809-3-radhey.shyam.pandey@amd.com>
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

On Fri, Nov 06, 2026 at 10:39:02PM +0530, Radhey Shyam Pandey wrote:
> The Xilinx framebuffer IP relies on Xilinx Platform Studio and the ISE
> Design Suite, both of which were discontinued years ago.
> 
> Driver support for the controller is removed by the preceding patch. Keep
> the bindings in sync by removing the corresponding Xilinx framebuffer
> description.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  Documentation/devicetree/bindings/xilinx.txt | 13 -------------
>  1 file changed, 13 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


