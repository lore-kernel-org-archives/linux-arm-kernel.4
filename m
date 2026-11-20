Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dbEW3yAy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zk5fViLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x54vwkGJvh84znXoJKgRSdPvks6XuVGgKq/gJmPTfQE=; b=dbEW3yAyp24JbE
	Y9yn9j/MSatkUQNDPnms5i8d5+bWdDGCThUiymCdN1yx47kdU9r2V0ED0gSSu/TI81b1UJFxAZ7GG
	e20UaDYiQbC3AoggdfWLLkvdr5/1fi4FU72PewYhDVaq8MnlcsLPOU7e1QE+1MZuNhqUAyaX7quD4
	BT+JnWx0Onq33kTYG2f0MrPHEFNfdt8pgCRjvq5lLV0zLoSquKeP6JVrsU+k3FeOdHyiTHiUNrN/h
	GOGhIggTD8U0rYSar7s1cEeM69du1N+SQEsYp/+ezGp4JilQcX/OOX+Gv45cqzvFndMtfbBQX5s8V
	kdIK786hvMJ0MeXobfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPjf-0000000FGya-3NSR;
	Fri, 20 Nov 2026 14:37:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPjd-0000000FGyP-3y2K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:37:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B283F4633B;
	Fri, 20 Nov 2026 14:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81A31F000C0;
	Fri, 20 Nov 2026 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185425;
	bh=x54vwkGJvh84znXoJKgRSdPvks6XuVGgKq/gJmPTfQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zk5fViLSIEPPjIhstwdcljs1mhbKQbngrYvTCsgddI719IHlwxGN7Pq161/T3IClb
	 4AuSD63fjJVLZ3dHl8E4Xraq0eJMJUTk2BhYYF72f6hI9VW7rXShkFqFSfRDyA8f8l
	 GK0GJeKScktiQ8GuTc3uF82I98/w8+OP+J5JZ3u79GUZBPrs+qAsFCuNC3nJJRkVun
	 DH9Kw4Zz2Dh7f3eDQ2EmiDEJpgQQFNnw+4LEIMGHt9PexnDHmAMZJG5czSNEjPFLf/
	 pj3RZNODT7nk5aUjlcrkKRFpW2crlu9yUxP4hpqHeOooTKwBVHKyIg13VDBWbxVN5D
	 iHWMFfgw1MfoQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
References: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
Subject: Re: [PATCH v4] arm64: dts: exynos: gs101: Drop CPU masks from
 GICv3 PPI interrupts
Message-Id: <179518541714.24590.13840055240522607419.b4-ty@b4>
Date: Fri, 20 Nov 2026 15:36:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=376; i=krzk@kernel.org;
 h=from:subject:message-id; bh=u7FKdVi4iwFQV3UicTf2xfX6Ejre3/Bp3Tj21sO7nvg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAFsKig/ws+ZeUZlxD/tQYesOJHYiRTvZ727g+
 6ryO65dMR+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBbCgAKCRDBN2bmhouD
 15JND/9LcLiYB00Y5FXKJjesB0i5tqx0mhcB3NhM7QBkwc1/KJZZ0RfHDcOi5a4V62U7/5g0NmU
 DAe+IMo3ZyiPM8Kc0JM5O4gR0yQG5Y/z5GWr+cjH3+v85hZ5QiYXUbu05onKqQUR823d2/kFOi+
 gIF32D7jeaXJU2szZAE7Ai7YIUQorM1jGeqUsiubzAsdilHhhFsYrLT1K1PJXVV5Ira/+WAt3xs
 xrTSOM3CuvzV2DT/gFHDWrmgHxtiJtEzSuBnyoFDBGNw6+kUARFzhSYZ4SOcbTomMMXyN0K3/6J
 BZHddHc5YVFHhO8oePnCnD/wuLp0qys3wGu9tpyna4NTL6S5mSbqJqGj3lj49yFVbSjcuaCxbTd
 2g7yhu5p8jTvvssw1CekJcbQwzCIvNedqalR9XWePONVYq6lSqqgOtvX59sJQAAR6aPvjhqS+Zv
 uurTZaRPnzhiL2rn9FR1mA7ppbh3nM8PHs9RHjrLFY3r6hWFjD7mOz5dPjiFegTVF1s12M11qvr
 FUcv9nimh47lvhYFVJn2f+IvaJClO4e1FH8Jfp0Sy3ZmNkykXIWtMIdfypp+c7PT/2rtzPlKrL3
 p1LXUNeGf9dao8ieUjXjLsaPZZs4/2+UIUqhvkIO3wmpwOds/Wuqychb633idDn4v/C0iPe9ObL
 3b5qa7uVQ/kMV3Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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


On Thu, 19 Nov 2026 14:54:56 +0100, Geert Uytterhoeven wrote:
> arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/krzk/linux/c/306301ca9340a6c7ceb14d735abb9cc380933a7a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


