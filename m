Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E496606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5AhKtlqs;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OdM/aStW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=; b=5AhKtlqsvIaTCB
	EoBc2RrQU0oXRBtooUGROCjNh/YMh9E0CuPMX23KxwTGqqIubgOxHpcEiLHMS/GN/lCVnYSUf/aB+
	IJUlA1HGumWrYwyA2m0cOdok8qn4thHAadpr7TZNrks8DvJCQRAsOY6agQwa1ZfiHJqfrfn4qp+b9
	YU+E49n8vxlaMYCZ75/dGsmQTDAtQgGWCNCq9iwh1dxOeH2izNS37fZMeO6CV8JUtpIBQ0C15p29B
	KRWSCVMySoyIIzFf2gMHFahqtjB7fjO9YBdjbfHKTZzh6ynodzJXQt3Q+Rq/86nmhp5bRpe0OUrAm
	hJ/mvyH2ABPvtkjoY5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2A2-000000001no-3Nfo;
	Fri, 27 Nov 2026 20:03:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX29y-000000001lz-2hsL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 20:03:09 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so9959513a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795809785; x=1796414585; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
        b=OdM/aStWMkax31VSkxj0ZjXXThnqyZTGmBaQFQyLFXotJ+ZKegewCBrn3/+s1w83qw
         /9Jri+/aUGzepJyUXx26G0xWR+kcuVvGPkVqLiiWTCITbx33LYsZbUMaS9+MMAqltlu+
         D64aO4CMvsm7iFHu7xYnW7wmvn/aQfmACkE23YQ2PWMyX9iF1Izl1GyCTpx0zhxkNQly
         UuvUydUSrXCzqG5pPmCzKaBVv4a19x55xKvJ8g9Pvmlvt0SJpJxrbrNSx4mwvfrW7E9n
         NWAIGynu4OTJB90x0hW67AV8QzJ7Ss+4cXGrB26HUlq892DG+1JW9JDA7mE51LWIgrcF
         eM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809785; x=1796414585;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
        b=B6eEX5hZgfoYVrgBoxPiqClgqmAnWQqpfXJgbyy/bb/GCTTFQ8efPn/0CZ4PYH8D4g
         XcfwW1mAgSdcj4DN+U4fsX6pffBB/yu7ZCV48yIGVoWbkSXO1MEXHXqT8jORFIgyQlNS
         QqdsvYplnmE9Tqk8TgRHLzP10IX4yOXVNZ9vBxG0SueCHqUnQxLdHyMoJ1ASFYptKEuu
         lmfNB5+9kDEEqYGGxVloOT4lXFMotONh8VHnSMDgA1goqNb75RFuuB7HsDygMa3CHkW6
         H29NGCz6hcuXvJZKJIyPMGzSg0ICL7ZVxMc3eWIhRFdopl81TJ5FgZv5205Ma0gbTCKU
         qBDg==
X-Forwarded-Encrypted: i=1; AL+hErFAeqEd2jmNz1YdQQohiQhnd1kB3p3fUGRY1yemI88Z0qE2IuvAsFXoyJxS2JRYrqrIgzU42KJQMN+O6m44ZeLF@lists.infradead.org
X-Gm-Message-State: APuU4Z956fojd4TI2t/rt0GJzoPgh1acJYLKG/39DjmHhwEB7vPG07un
	DQ6gX840zWGzreFbnqpjJ/vudG3dI1j515oJPqAW3B7XzcGGOZF4spZQFFVWHzat2v0=
X-Gm-Gg: AZFdTZfOBJwVMfyWf4OA1BOWH2r5ofPiJfI+oRrH4Dsfo5QfOLYQXIfzTIxobgEPyYC
	UAnS0yEL9uccBif2c9w8OtqrszLQ2G0lYGIga52WCn4RM6u1G44/SGQr6Bc2Mf0YkhoThGXaHoR
	J04cl1zeIhqcUnvkgFxk1ns7GeJjMjRBxZwBpYQ+H6VB81+og5nnyNZG67w5MfIolMfpVyLZIkE
	7Wq1H7siKmExC82QsPYWlmRBXBb4rEtu5Pln6Va3wkp66TrI9SFil53JpZ/mR1r5i6rSTwfUeUl
	pcqCWVxBIVIRfrYD6QVfdpTQ1cJZYX/MidAr+j2OGlDwk5tgvi/12pNk5h3NWNtqIfSLK45MLMa
	5hOHmRcvR+Cte0N69XIlHm9ABp2JxaI/z0X3rBXq6zDrxJgdcmsY5B593gD1VE/WBL3n0e6vcwY
	yXKn4bANyA8diA12K/XydXPx4aUsCGVLOqRuQG6l7ogaXrGD2gGF+pIwF/2/UpENOqeazcaJSut
	yhx6AAz9wkTLjJpnF3QqDNVlYEr8OPylEHOrRxli+Wfz/7x9Rvb4kaetXfwwefqaIezoEawvntU
	2PX1VZCbKBi2gdK/fG568CXQOyUmSCh4b8BJFeba/dweMXEX
X-Received: by 2002:aa7:d402:0:b0:6a9:8863:ada4 with SMTP id 4fb4d7f45d1cf-6ba1fae103fmr14763271a12.3.1795809784883;
        Fri, 27 Nov 2026 12:03:04 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm9906969a12.37.2026.11.27.12.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
From: Jerome Brunet <jbrunet@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
Date: Fri, 27 Nov 2026 21:02:59 +0100
Message-Id: <179580977968.3028968.220600254133838233.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=438; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1x7I9OxtWjxbS+wEVDFGimHZA2zKBIWqfRJtzMCbXkE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcD7/5dtokM+ZkaTF6K2ZGVttk1rMrH2fK8un5tvb9D
 fstDRc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJH4Q4wMmxfdaay4eymZS6GK
 Z55007ypBev3ur2PCN636eTcxxoMGYwMv2pstwfXV9w7/0GsKypkd/dKC/bAd4cr1ViY1xxhVqj
 nAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120306_986587_BAA85494 
X-CRM114-Status: UNSURE (   9.44  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 14:40:34 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> about consumer devices").
> 
> This commit added a struct device pointer member to struct clk and a
> parameter to clk_hw_create_clk(), but the new member was never used
> beyond setting.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


