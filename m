Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE517606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oCUm3oIN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJlpXeLV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Date:Cc:To:From:MIME-Version:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=; b=oCUm3oINWqXSe+hGHTEtbHXxYi
	HCV+ZwzPeIWHsaEZhIpMIQ4+fxzf8PkoWx0Gv4oU8H0HrSNeFIEHZW4PBB+00on8loqqP6rckcR26
	0uY5cq/rZ5iVZ/lcWkf1cESntLpfB4VVI9cd9w6HyYeZeLp7AYjg3XorqNZBDhEXu2uh8f/Ls3dAf
	rF6EIJLWyBw4cUR5zaoNVSQpPOFqGydUBBtZaAdNeJhZZV2qtJWdMnO6Kv3Ix/1x54BKeQJmrGyqT
	DBCD4hFJ2yYnRtWxM/jnpNd7zQcOjGLXSjYGJt1RuE0frcOvpGFZRvsgwr6xObCN/SGekShJDvUF0
	yYDiuFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR66R-00000006Q63-3Naj;
	Wed, 11 Nov 2026 11:02:55 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR66P-00000006Q4i-3bfw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:02:55 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-37600b0db49so1158018eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394973; x=1794999773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=BJlpXeLVAmKZNAkrxHt7JC9Jyhl28Uml7AZ4rQ0J3drHYlilPSwxgkbRaelSf/q3IZ
         BuWxTeAY9+KnXzm4aDu7cYYV3TmT0G7OyeJp+vGiRverO7sLgGm9W6op5b5va1V/Gtif
         ygyA1Ko5PBtlOn/myimuegPJZ7YJErd2f1KGaSzVQM5iQgd9VKxefqN3krPAaOZV0M4D
         UeJhRqeDx3qm7/WKpGq+/KhPvoLMjIJi55XdvZx+wvGIqIWv4Axoo7yVKVt/11QYBFzJ
         kHcwboJ4v0mIvyITgn9MUHcQNFG+0HuWt0cnp/z3Bi6wnymZsR+U0G3OX36MYMMyULTY
         vg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394973; x=1794999773;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=BnvJgCd/FK5cgCcQLaUCSm+/mydnkf4k8J0XKi5oE9yKS0raf47XpybhS46eAYc/r6
         dmAtYrs8awZ4V3JgBL6nVYjYKTiyfSmfFF9txpAfgI29se1PVeJWk5SP2/RnXTXy5zlS
         zJFwGkP/0WbUp/7okQIs8w7hkYVNdi515q9nDQuBh2YjNPyDTZa6g+EAefRSfqHcEZ+W
         pQJF0nxmod6n9qr0UyUnsYplXSOGSgkVj/eKMGLQpuQNGHbMPsfRTkVmORhyk3UhIFNo
         iDPTIKXTE3ScAqntRQVaacY/zVaQiQ+jpwwPmKz+12rvys0wkq6iDJk6ELWff2UIdSfe
         oMBA==
X-Forwarded-Encrypted: i=1; AL+hErH6irXPAKwtX+tG5EckMN8ZhocczAhwtRLgosb/6i+XTv6f9PJeJxcl0m8dC0f5XacRgzaKJbTSqEUC5blaZHkk@lists.infradead.org
X-Gm-Message-State: APuU4Z+G1jcG/DjowJv12UPCSkTR4d7Xr2O6ZzY4uEZSJYo1w1eGApvk
	6lJRYzZ5WaLw2L3eNfIHW3mBRE0J1lMnLj0ipMdz45RWhS+a5xKoNosq
X-Gm-Gg: AYBFou0lhXq8nCetwGljR7wh8q12BO1QNLvsifRCUFffPPhZroLjjvCN2JSOfHS/YLE
	z4AP6NBAFnQMWU5881PIVbQenXZDUmZW/GWcf/iXkIYSZWJVQvTRtR2X41rQZ6JfpD7IqHHmINO
	zH3z+au91Xq3L4ibA46jw5uw7etwe8AJz7sgepSwnHjrQIryOGkwqBFVUlfFOn6mExjERwjVSIr
	Ed4U+4+rKZBwPa+UZg2r7XF0/w+pYoTtdV/iMrcx0p8OMdwv2e5k77kmPfDe+nUZqeF3wmFdtLj
	HtDZ4epkJckjVukNM6vBo+Bxex6AUmec9qzNhVeyFKW2z3o3Nkj7jAFPl6DVDTSDat3QqaMT2Ue
	bGGs7BORllVWAqcAyw5Cmx7JY5OLhLLly3YZzGFXQRD+DJioUp+XsbOl484lGiDYw5Kw2Zv6ZZF
	+cGY/KT/yZI9/OgsyZ796fNWr8Weg0bgs5r9u/Nf93D8eTSHLSIb2ieTAC02+D7thYeKHpvduCO
	ssxiKLhNkSflO5JTdWBeu8fN8Acx1EyXbtHzQ9aycnW+NyEYz0GtFOgSu7Bsh2DcOtv3Z8Y5MNa
	l0GNRo9K4jvrLrAMu6RlKBvp1sNrs/GhozyP7TEKeiIwzqzBQ3j1QWf75q/CiP5NxDYbSv7pFXM
	OM31GOipelZ/njZhfrNkUVDxgajvFAxDkcF9I
X-Received: by 2002:a05:7301:e22:b0:36a:37:1404 with SMTP id 5a478bee46e88-37686d2fcd4mr3499154eec.13.1794394972545;
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Received: from manush ([2406:7400:94:5368:19d0:c01f:d33b:214b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm30729052eec.23.2026.11.11.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Message-ID: <6af44b5c.67914289.fe7ab.6559@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: s.hauer@pengutronix.de, Frank.Li@nxp.com, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: 11 Nov 2026 16:32:50 +0530
Subject: [PATCH] clk: imx: clk-imx95-blk-ctl: fix error unwinding in probe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030253_908396_7C8EE222 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In imx95_bc_probe(), bc->clk_apb is enabled via clk_prepare_enabl=
e().=0D=0AHowever, if subsequent operations fail:=0D=0A1. When !b=
c->pdata, devm_of_platform_populate() failure returns directly=0D=0A=
   without disabling bc->clk_apb.=0D=0A2. When clk_hw_data alloca=
tion fails, probe returns -ENOMEM directly=0D=0A   without disabl=
ing bc->clk_apb.=0D=0A3. The return values of devm_pm_runtime_ena=
ble() and=0D=0A   pm_runtime_resume_and_get() are ignored, potent=
ially proceeding with=0D=0A   an unresumed device or invalid runt=
ime PM state.=0D=0A4. If clock registration, of_clk_add_hw_provid=
er(), or child=0D=0A   devm_of_platform_populate() fails, executi=
on jumps to cleanup:,=0D=0A   which unregisters registered clocks=
 but fails to drop the runtime PM=0D=0A   reference acquired by p=
m_runtime_resume_and_get() and fails to call=0D=0A   clk_disable_=
unprepare(bc->clk_apb).=0D=0A=0D=0AFix these issues by:=0D=0A- Ha=
ndling devm_of_platform_populate() failure on !bc->pdata by jumpi=
ng=0D=0A  to err_clk_disable.=0D=0A- Jumping to err_clk_disable i=
f clk_hw_data allocation fails.=0D=0A- Checking the return values=
 of devm_pm_runtime_enable() and=0D=0A  pm_runtime_resume_and_get=
() and jumping to err_clk_disable on error.=0D=0A- Calling pm_run=
time_put_sync() in cleanup: if runtime PM is enabled.=0D=0A- Addi=
ng err_clk_disable to call clk_disable_unprepare(bc->clk_apb).=0D=0A=
=0D=0AFixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driv=
er")=0D=0AFixes: b08217a25721 ("clk: imx95-blk-ctl: Fix synchrono=
us abort")=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@g=
mail.com>=0D=0A---=0D=0A drivers/clk/imx/clk-imx95-blk-ctl.c | 30=
 +++++++++++++++++++++++------=0D=0A 1 file changed, 24 insertion=
s(+), 6 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/clk/imx/clk-=
imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0Aindex =
bc6957299..ad386a48e 100644=0D=0A--- a/drivers/clk/imx/clk-imx95-=
blk-ctl.c=0D=0A+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0A@@ =
-394,17 +394,29 @@ static int imx95_bc_probe(struct platform_devi=
ce *pdev)=0D=0A 	}=0D=0A=0D=0A 	bc->pdata =3D of_device_get_match=
_data(dev);=0D=0A-	if (!bc->pdata)=0D=0A-		return devm_of_platfor=
m_populate(dev);=0D=0A+	if (!bc->pdata) {=0D=0A+		ret =3D devm_of=
_platform_populate(dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_d=
isable;=0D=0A+=0D=0A+		return 0;=0D=0A+	}=0D=0A=0D=0A 	clk_hw_dat=
a =3D devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc->pdata->=
num_clks),=0D=0A 				   GFP_KERNEL);=0D=0A-	if (!clk_hw_data)=0D=0A=
-		return -ENOMEM;=0D=0A+	if (!clk_hw_data) {=0D=0A+		ret =3D -EN=
OMEM;=0D=0A+		goto err_clk_disable;=0D=0A+	}=0D=0A=0D=0A 	if (bc-=
>pdata->rpm_enabled) {=0D=0A-		devm_pm_runtime_enable(&pdev->dev)=
;=0D=0A-		pm_runtime_resume_and_get(&pdev->dev);=0D=0A+		ret =3D =
devm_pm_runtime_enable(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			got=
o err_clk_disable;=0D=0A+=0D=0A+		ret =3D pm_runtime_resume_and_g=
et(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_disable;=0D=0A=
 	}=0D=0A=0D=0A 	clk_hw_data->num =3D bc->pdata->num_clks;=0D=0A@=
@ -462,6 +474,12 @@ static int imx95_bc_probe(struct platform_dev=
ice *pdev)=0D=0A 		clk_hw_unregister(hws[i]);=0D=0A 	}=0D=0A=0D=0A=
+	if (pm_runtime_enabled(bc->dev))=0D=0A+		pm_runtime_put_sync(&p=
dev->dev);=0D=0A+=0D=0A+err_clk_disable:=0D=0A+	clk_disable_unpre=
pare(bc->clk_apb);=0D=0A+=0D=0A 	return ret;=0D=0A }=0D=0A=0D=0A-=
- =0D=0A2.46.2.windows.1


