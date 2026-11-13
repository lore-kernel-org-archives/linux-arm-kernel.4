Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D822B606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yrkBc1Rp;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kO5Uqe8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=; b=yrkBc1RpJTBqAI
	8FWQEOJSSxbAs8L1Z/ILeGoGQE6ArEKJcyxwcjcurZb/HLW5kYUiqtR3j8OvXXWcBy9sMcy1Gow1r
	f9pQqObHYeat9D5Zf/nxu1fIq0pZO9Na8XDEQDNe9e/vLLl055eyheHyMmU/L5uq4ZT2QPLp22P6g
	wv73i7kQqpBkowdUX0qz51ozi/uICQbZwH1iVPne00xaI72S5gO0jTObTxRwh0M5PxMNULMscTy7k
	ZJ8nLGymmwTBj6Lhk0xzYt8sLQi0lo/bAR2fF7vaanEfrKVKnxEYC1bbHQZpjfWUckewjatxwjRU3
	6620GI/t/yFtm25eWtcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrm-0000000EakW-2nHQ;
	Fri, 13 Nov 2026 21:31:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrf-0000000Eah4-1jp3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:31:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1568050f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605477; x=1795210277; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
        b=kO5Uqe8wTsjM0zbZziC74lhpIL0P2vp/wY12ZTeIXo1LgGPjucnaItixT98vSL9ZNl
         rHaGH5wAUQp+/cr0IRvv8Y9dlvJjDeP8H4QmMe/QQxPl6IdP+YpKZo+rcPHPS4AnYrmZ
         +4FEOZe4eFMmkni8s9a4tVL+8KejWbDcKYADBnIxIhVoO4zAZ1CSIj5BqdlEGA77WSgE
         1g4eFcP0GFZkyBnF/w90tNC4Y5x3Co/xElvRhapqb2FfCKiIa+VL39hplAsAJQCzjaOo
         0LlXo5DNpmGGt2D9H9DqwKgtESfW7MI1WZ5j33hYWJkdEgd0Se8ySGDT2tBY8MsD8/Do
         cFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605477; x=1795210277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUw0nvKlEMgxXW/vhONj7EZkx2F585mM1fi84MvMFks=;
        b=pZ5HQjf1uEIuZ0wg2iCxvjy8P2+/ihC5ypwo4rAATjkerQ/4qFZlHWLdSUKoRpP2PU
         4v4zAHHQ7ZS+ByPwZIZghJchxeH9l905KIZkMcn8KcVMRlVuuqqJzbv19OGQSR4Nbc1s
         as9ARK5koqZy5CRhQX536fOLSHnh6MuHjg4UzcyEt26MVF21R7Gjjhx2D4B0NC+GGap0
         dYDDY9CySAqqh6FMyzA1sz2K8NCbHHUOguS6dqJElCeYMhf1Ks65p0aXmJSth8ndr/uA
         IlmqSUC3JqblcBL3KELvTnwDFYA0CFoqDKwFVL1KJ7QkQxcB2uSTKHjGUrSV2SnO7FHx
         sJeQ==
X-Forwarded-Encrypted: i=1; AL+hErEknWtZLoK+/b/4rtk8liYnqKDHe9jJM7LD1n1Gne6VE0i3TJbipvckdSLw7Jg7BoC1LSQh+zGObdaKzUFEmFRL@lists.infradead.org
X-Gm-Message-State: APuU4Z9gxnDQ9x4XMGzykJ5ixk5ps0KZAgUMeQ3UOD9gxIBoqnKbpuoQ
	itoYWqaSF6v4t9yW7J4xnUTG9ZWewUAZRQlMZyLibtEW/86aeT4+K5dxVls1TgPoaRM=
X-Gm-Gg: AYBFou2ObvGud6E7s9RHZBlCyyr+DRnOeBymXKr66HpNkU27V0eQZhSLRQXMjRcnSlb
	v0UXXRR8DTCvvZXwvbmjcMxRbwUxRYiK6zW0QeNTHoaUOa8EBwMI8T+hl20MWmi+I49t1aZMrJS
	RamwCILqYLnkrNgET/Z9MgWnXR2eCPoVXQk3N3bc4GjQEhbEaH89u2YnGg0Z/NJo0J2YOd14Jtv
	aneQguSrwJLJ/EbjrrrGe9g+fiCtxGNp+qucDl6maAx0BwcRqKL88uHmiPXTN+MIe4GEMCXrYNf
	28WcK60fB/pBaSc2J+GOUTMoDR/qKu9VPgTfPm+/QWYCKUx3mvaeGzSNs8JM8ASzkKx1GbaTG6g
	qz87nMbNji3I5srwD+SkxHXNdmxS8ypbfQYd+ECpO91EPP1W/VC2SVvs37q5s5WzB5+GLwtQlJn
	P/9DPptE1RBCr8LCfoWwfEGpq+t92YSeoFdRMjmEXYBxiK/H3hvaAUBTEqeEwKHuXbf8OO/GkTC
	1fauIAOeaXFA1fCOVtXbTyi9TQ+jL/PzYDh2r1P0EOvghuqm/lLAkIsUpqgf4Xv6kVPkArEb/6K
	Q90GC11ZCmekITmCF5EER1ABYv0yeEdMVDrxAYkdrZKKW6wZX8lBBURg71liETytfOeEK4+3zyT
	RqrgqnaPYi2LmN+BSVpI8xddlgw==
X-Received: by 2002:a05:6000:4808:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-49c712ac577mr8479439f8f.28.1794605477439;
        Fri, 13 Nov 2026 13:31:17 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:17 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:49 +0100
Subject: [PATCH v3 3/4] clk: ti: fapll: print clock name that fails to
 register
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-3-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=826;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=B0LneKztqvoYqUGoopWi+2un+koOSmHaVdRmdLk82Hw=;
 b=CtNUW1hP6KMI8YN0W1Cp0N+O81Trkq8lga9jGVtb6c+zVucXupTCQIA9gWYojp9PDIrrA93Ah
 wbwN7HKaXLWCGAh9JuY8MP3xsWIfx7VnD+NuvqFIhl3iD9AO4sqXcTz
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_133119_500837_A68598C6 
X-CRM114-Status: GOOD (  12.62  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Improve the error message when a clock fails to register by including
the clock's name and its parent's name for better debugging.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index bb9986508578..7d6a4dd4fc8c 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -524,7 +524,7 @@ static struct clk * __init ti_fapll_synth_setup(struct fapll_data *fd,
 
 	clk = clk_register(NULL, &synth->hw);
 	if (IS_ERR(clk)) {
-		pr_err("failed to register clock\n");
+		pr_err("failed to register clock '%s' for parent '%s'\n", name, parent);
 		goto free;
 	}
 

-- 
2.56.1


