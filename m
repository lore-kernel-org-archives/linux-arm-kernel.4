Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680560A6F6E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qDHenNjh;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZC/q1jJr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=; b=qDHenNjhK6Fg7Q
	ce4oulavqF9BOYpIaDkiQSajTrtpR29c2wCCWNkF52Cbatxaj3WFqYyvPzGF1+B/g/8jDVK+6o8Gn
	q5ZpDoV5wMxc6+Z3ciA3ZSDu0jrkaeenPAHbrMUFp2GyC+81pIRl9ongBeWGhNu4d30aLS/qMoZzh
	h53aGaXrnBl/y1Dff62ZBfePWXInHHV+4g5hOVyQ/sfytD8nmJetKDby0209TzcyFMXYtnFy/vBEk
	0Mzt7TfnN9v3/qlSve+0zMXDVO3i9P1/oFVcIoK88hAYfAJIrGGlSCCuKYNyBAcM5kzIfLEkRx8Wd
	+oxj2Vyf7rOdQqrtiyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtpC-0000000567g-0SWi;
	Tue, 10 Nov 2026 21:56:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtp7-0000000563e-2FK5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:56:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1401288f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347771; x=1794952571; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=ZC/q1jJrKc33oJhEt1py/ePrntPrn5twyF8JihxlrUilJk6R3H04cEIsU4vG0kEMrz
         MEIudqO1R3Tv9c6J3Avd8cXLEul6bSSQhBFwOQgOgIw+kCtMcryrbSKHO19U8+niG0QW
         8cbk0NuM4XvQeur0bXjHUAjOfIWk/cjzMeFIGGrzzGyJVM8nQCP/UliK3tGRngHAvW9Q
         rSbyUqoZCJ/eaA/tEOtpE0nj3V86OHvuPV9r3aS0r9ntP8vl966NdKXeINb3Asg9rZxz
         f9atUhuruzFo+FIDkLYjKXugWYPpyCPOC564YxGc4oLa00qQvK8rAHP9vLtzGRWodhip
         pHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347771; x=1794952571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=ivU3D60hygOM8DunJfBC+9qCZ9bGmz/wMzeHmcPZIwHTEXraAH2UrUV3kWSAkTv9Va
         LKmRW0QrE+HTCtIgKYPHhaxglrnP47ZrwZBUOjpXAwMCIPEL9IA+26j3g0u2SsCU75rc
         zJwPa/qPAMOcEWOOWa1YcdFQNsh2kC/3hJj9zLB5ARHB0+M6yiZERERmWnCUn1Ntx3cS
         dDUatgua5wqq8hCC79Z/IVv+wfmNhBeDwGeeat7bz50GJBv1XsAckK0hj/60+Q6jbL1t
         mMNFJ0LjXXvXTVpx8qXv9ZVekgcAL33DKEMKbLA++la5GQpXrtHsnNIaJwuhXViQc3wz
         zlbQ==
X-Forwarded-Encrypted: i=1; AL+hErH9SKCXmvc729s7PpEhSnVff3TcOgsNFWqcfW7TwFEa8HwEQME1rJeipPtDiAYx6Z8ChfnX0VWrUesaAYjY5ZbL@lists.infradead.org
X-Gm-Message-State: APuU4Z+lz6yNOSKpf8vDqD8EsxRt4o6QX7gjZL6cB1JnVt1TWVDrzDMc
	eSQnmJ508V3NbmJQEbHt2KrYEX0MYJYMrSqapZhaTMpbc6sYP6gKSAaquj9MtkvG03o=
X-Gm-Gg: AYBFou3fhfeMfkmYBTIdmXBhxT3l5/8Vj628vpu/IRfHUDJrA0CJiEwr7OIyIwIRwfk
	XxX3M33B+3hJhAMtCvL87RMDj5POHvP46ggsEivKymAhGZGlPbWVGgr1P+rlNw7jpepNRgzfBqS
	fTEBiS9yBa3sZeo/OwvRBEWwdIMgVrlkJoi5Odz+ThZTqefxKU7G5+wcWnjqWN3YSdLnQE9JnXy
	UHPxhan5eONw/huNv0rZjAjlnUmECOil2G6lmTjDplWFpfbnFXS7Qcp01JEvq5m4tkSN42NURcD
	FvrH+Yw/ii0bVRkvVL7tJLqnx7LuzYbO1/lsf+9ncOKE4b2qAD5gAbZboPAN8I7XkdvjQnvRu+X
	KoIVQ4k/384iQD/X4f3jjv9u/BVm2hgEB18InFk+A0wyUsAtaZtUqIcCIRkP8MfLifl4Q8yqRGn
	nk0FPMsy0r12blDz1QKZXRxUdf0kRgsyvcJR+58JzAzuDuj0NIuhLE1PzHfekJBme9gTSN6HAuF
	Po16y7IP3Q0L6SfcdC4oBwJRqeyE8w7RnoYkp9Wn4kWDg/spctQGA9jJUtzCcdjqtdWo/ru+7h7
	r8r+p5KkdHvgEqmZRftlzba7+Wu3m1drDA==
X-Received: by 2002:a5d:64ed:0:b0:48e:6f76:dea2 with SMTP id ffacd0b85a97d-499c69cb701mr366245f8f.38.1794347771565;
        Tue, 10 Nov 2026 13:56:11 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835858f26sm7338595f8f.18.2026.11.10.13.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 09/20] mfd: Drop unused assignment of platform_device_id driver data
Date: Tue, 10 Nov 2026 22:54:34 +0100
Message-ID: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2UUtn/8z9q5Vil/qWmXv1wRJuUXUGptLBomjMZQsNCo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85K0kB+I64ERD0hCsZyM86WO9lk/0iKPumZ0d RCE1dtnaRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOStAAKCRCPgPtYfRL+ TsofCAC0U2NJpKBqUl4okY4yooT3RlrkPcLeu3peOyFH4ZcFWAIRXbvvYK1Rm8+rb2RqhkOd8A1 sc0aSu4sqf/Uwz35Y7wKCOWUS7OFm3VoUfj77VKhXpSUf0LOXB9IZN0tf4CLIZunj4gS8e0YU/Y 736EXRz5MHk6g+CxnOLM/4N1iIVK31WRGBx2V2XY41wue/5cWWHY/TSL7lyU0Q9y1YPbKnd3kz4 yuJYdJAnaJtqydkGzFGZmtJeTHZauzOGUevEieD/vdxCKTlYsIBIfOqgOTr+AWvxgcAcQw+pNue UyErdr8iUXRmfPkuz0yG6yHCdwBgMmipkoax9/lKTDAr76TH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135613_935413_96EE9E93 
X-CRM114-Status: GOOD (  15.31  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..e74936ac206f 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.56.0.rc1


