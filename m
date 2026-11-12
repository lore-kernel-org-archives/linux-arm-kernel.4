Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35858606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2N313/wq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnyaW9fu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nzr1i8kmgcqILZlSzSWseg8RY9ufaj9ibgqjyLSLbkg=; b=2N313/wq20oPlQ
	PpfzJP1gTZtqEXq/2ZH7EaZ4G5CNQm4/6Aj3VrlwjnEzEdLLGuGR+/hf2IBEZo0kSQCWtDbVhKiyp
	JjJsReDBvK0JKE9uSueQuZPL/B8hIUeCIv0OWqFX8aZ2B/0Y4oNsphUtSXn1LTwNdfPT3Y4Ug4PfL
	7cfYobngiCXJqUS6vnAtMTrS5TbBH5YJuKHQsS8lQf91HfbrQajI7nXIA/P+8Is9ODYk33cMGbWUR
	RNoHalzlM19Yn3QX5KBWTU9gnWGuVKjEiZ1x1BM4Dkl9XAiuTud8JJRuSJACAA4t7nRj667tc1g+0
	eieOaTkwxYKc7WWKkvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSRn-00000009axx-0pva;
	Thu, 12 Nov 2026 10:54:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSRl-00000009axp-2xxQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:54:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4DB561D5D;
	Thu, 12 Nov 2026 10:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219031F00A05;
	Thu, 12 Nov 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480864;
	bh=Nzr1i8kmgcqILZlSzSWseg8RY9ufaj9ibgqjyLSLbkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nnyaW9fuM4QMfEs07StEF0ZXXF5G+Pmg+xGPZPoCbCplbHS3SywWWgJowBdyU9Wce
	 ZZxuOVQkxtJ0nZxojNilzoTZH2uH4ZNmwtefwlqvaaFEKA7T+8DkHbVYC9mGuWAI6h
	 atqB1VCCVgovVHA0zWvAexLyzzX+aPFoRB9f+Wg1akpS4586Xp2PiifqrQWrcHqhyT
	 WJEYQtFrVP4sVZa9gAG4L/+eiUSEB8BnAENojDQNLwM2Y6T+Y7H96jt4ZEHfUnk/+x
	 3NooBYNei3UAoCrLdXO8UBaU+YaUDd8ctgtiJalbzqcN9n/3cWLKdHeHI4FLZCCCi+
	 Pk9w1YxvKtgRQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add support for Samsung Galaxy Tab A 10.1 (2019, 4G)
Date: Thu, 12 Nov 2026 11:54:15 +0100
Message-ID: <179448080494.71722.17775679288828912464.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=krzk@kernel.org; h=from:subject:message-id; bh=/UDUY46rb+THvC5XKdaD5CIzIRZSc9hvKG7hXVQOvHU=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9ZrXtBre9ERaktNJORcTcKjnI82iK0zZMGsfr K9VYECADsWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWa1wAKCRDBN2bmhouD 1x7tEACPOvFgrInugGpJchVAQ1S0WkbfrDJM5d/ENDyzsvj2xBvRKrQS2lreM5YGUlfR527J/6W zHwHXN0VGIddV4MuqzdWZ+tyt8Ea+QfvwVmCcmQIWSGMdbdXXyHM4Kb7PDd+qC7zzY1/tkLixCX BgQ6bbUcfo6Gyzd+EZtYXkZ7lkq/PtWMD1azW1PcWJxZg9XX5ZEBj8kO5NNtujBNOlTV7KEN2oC rRpVglv7Vei+fegrCVS2CCSfr75AUhPBPZDzrU5w5dnYZu305QDDdvoiPP01OEgSD+qZ8BAi75H ba6rb/3anG0ar+ErhNe/ks2BGyy0nHFhu7iY0xhIM0oA+qcz04VwueYXXfS//am3zIMGL9XYIel 4Cydfpy4wt/9Gevb13TasmVQ0l/ftjv0gImD+4PstFQMWcrWq+/F5V+XcC5Zxw55LHv1TymeSvz vOhFfPBAlrDqwj9HHXZvLzIjKU5JLqeTUNe+5eKYz9pyT72yqeetzt4HqE3TkrLwAwb4+cMKbaJ 4BbOBl3MxJqqX7dnQfLKQNdGfX/2KBi9LT9dQjXNDQvmY03P+HFRJZCepOwTBY3jJNVZcABK17h TrLfSKv9SIiORuj1cpKOxIjSGy4I5Uywlc2CMkVc1Z3fbWvjyfA0eCBUpjDEjUbUCRH0apnG3D8 +7XQfsA2ExnxCy
 w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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


On Mon, 09 Nov 2026 21:02:01 +0000, Umer Uddin wrote:
> This series adds support for Samsung Galaxy Tab A 10.1 (2019, 4G).
> 
> The device trees have been tested with dtbs_check W=1 and scripts/dtc/dt-check-style
> with --mode strict flag and both results in no warnings.
> 
> This initial bringup consists of:
>  * pinctrl
>  * internal eMMC
>  * gpio-keys
>  * simple-framebuffer
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-T515 board
[2/2] arm64: exynos: Add initial support for Samsung Galaxy Tab A 10.1 (2019, 4G)

Both are here:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt64&id=a7e7ce777ab5ccb24a4906b79e1a3645e191dc9b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

