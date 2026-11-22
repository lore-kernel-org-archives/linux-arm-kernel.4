Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C8606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e9PeGGh2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dyDUqwj1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=; b=e9PeGGh2wksYPbuwVDEjQ1e5CS
	BpotY7xiHEy9gR8xSdN699kcTuCyZPr5p91ECGc38aN083gBMBzBENPC1ArR598lY3yOiLhhiKO7C
	4Y9fR0S52OYSCqL6qQRSF+/ZWOEipXIdiKhkPFy1PP2zKOgSI8kdu13o9XGyWVKyIvYnMLqszmU9z
	9iLFLlC9VLNEX4LqsYAGL2HtNDm95kXk6NLzmWw3oMZvCyrRyYlidwIKiKN2TtD5TvbJXcHDXsdO0
	iskoiEne8EX9KfuWiDpTWPzPL6mDGXDLJ9QYAHyCt+NWCo6fMXA0w9oXPNJDXo5BFI2+omTFKDc+G
	MCH/ZAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3vJ-00000000uxQ-0NnE;
	Sun, 22 Nov 2026 09:31:49 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3vF-00000000uwc-4Aa2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:31:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b40b3772f0so252801a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339905; x=1795944705; darn=lists.infradead.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
        b=dyDUqwj122vJ4cWm4eHhUXVgHJEHEjNG20gpbmYxc4Y/iFwqG43vuPsvkcRyQlg6F/
         xlmbsrDZarNwa2rBQrsrFyqW5Md8nH7/Lc238cD10qy2bs1QYn4R5xJSjnwiq5Zn7hOZ
         tIiBMOXx4MwV7kK7cKboj5DHYn621vk6xh58L7nANsfe2EMFwZ1yvDdoCem0qf3QZv24
         2LhD82RvAbfRxVc7ank3h3HEqLjvzFf4Cs0UKAfkUGa+4FUJSeeLyoeeW5K1fFkpuxi3
         zFCHj81d6n8UWOqk0PUfzuSYsPzTR4MRWE4BFL74690mTC5RBQGcZNQ20wRYtRI1MgaI
         ct0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339905; x=1795944705;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
        b=dibmmkeikBu249nf4v3E10z6HRQTXIk0xMjTouez/zXtV/A0/6UzLU+wIkx9Vw5zvW
         lCYiDn3YsIlKSJTYaveqExSzkq9Anu/iup5tCts6ae46xQmUQTNdLkE+/wdBcQqh7D5M
         RsYVmz91ON5GiCFzwXIsQl5tnjH70rlykauhTf+1ywZEZpOsuk8m+gV3sZfvu2hsz52Y
         XWMEsdl1nTyIqjQTCwXUvW5OPe5PE1cNCiThXmPEYuRJdmI2UThrnIsQX+ZONmNAaDnx
         Du+LvJRK/6b3h+Bow9hCvumlF+PwYMnk0jS8g6vxkl2yvMnbTwFmk3HeHcqT2jRJMSXp
         7epg==
X-Forwarded-Encrypted: i=1; AL+hErFnQNMl75fnxKV4kFI9RxITL+QI/DC/Nqw7HZpJHxa7y5L5xe1ZifgQVjdtmX3SQbFvaKA/mHQbXmZMaNFtpuEK@lists.infradead.org
X-Gm-Message-State: APuU4Z9nwWlHsHjLAnGcsvtVv2I97Ltye6O+eaAZfBJIW7RhUzcoOkUy
	7yjkHXjHHA0vxMzpU/pyFiaN4VWpy8qsfHwa9Zi67nHwYpR76pwPR6mJ
X-Gm-Gg: AZFdTZdwkc8k4dm7MuG4jxUR6hMDoic0An4+gYwZqds85iLwCHDMdVt9z8R9F3AuC2p
	2oC/6Aij5DE7nLQq+COT6Wen4CNhXdnAm3HULvgCEXP1VgXpr+v5nx3YJnmE5ToQXylZQolxAXn
	jmks13RbOcs6cOd7Yc3gKp7gU3UVi/gzJaescJD3YsrKH9We36ylWCyrOZOKppaAxUt9gsEpa4b
	wgGI/82lZeAYKvWucv4PIDk/UeZzg/rFszfKzWmOydHox01u4aHNLStl4ATfLCRVlNUOPFE8nDN
	rDsu3CHL2YaXVHglgZ+r7zqwzf21PPQ1CH6qKpDbZFstDGTTXE65DSIdAZkxzRsjh4uELZc8/Zh
	f4+Td770bOSJxGsfY8af4udCKSfaLvc5pF6TyI2ZJ/3SHUfq8XSUb9VWL8NryLUeQ9K6EzLpCOk
	nL95zNflcrCf8Rs/sqTmwEVsOVFBH+cHo+SlZemoFo45//WQ4jU4ZHBFEEx+gipYF/2XZD9fg3f
	cBfy67oJtzAbPPlXdoD9Xrtiy7ehChZvl7E7F3W2gr2A7V5btrgTJqZJaCcM6PKjP361+hUeGRd
	Gvp3cayiWv2CDOtvGEK9sz/NMsIXrnBOPORuLTIa7l7f9ljjXpLs0xqeDH1zwOv6AG9eY1uMy2R
	tiTsBLobzMS4zKDiETTn2ygOqm60=
X-Received: by 2002:a17:90a:e705:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b41c7e4cf5mr11892464a91.2.1795339905049;
        Sun, 22 Nov 2026 01:31:45 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14795295a91.17.2026.11.22.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:31:44 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Yan <andyshrk@163.com>,
 Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Alexey Charkov <alchark@flipper.net>,
 Igor Paunovic <royalnet026@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Sun, 22 Nov 2026 09:31:43 -0000
Message-ID: <179533990370.107225.5765165679182115805@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_013146_034886_9E5A80F7 
X-CRM114-Status: UNSURE (   8.89  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 06:00:39AM +0100, Sebastian Reichel wrote:
> @@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
>  	status = wait_for_completion_timeout(&dp->complete, timeout);
>  	if (!status) {
>  		dev_err(dp->dev, "timeout waiting for AUX reply\n");

This still drops a reply the sink did send when the IRQ thread runs
more than 10 ms late. On RK3588 (7.3, KASAN on, v11 of this series:
same 06/23), with a SCHED_FIFO hog at the IRQ thread's priority on its
CPU (busy 40 ms of every 200 ms), 1410 DPCD reads gave 183 timeouts.
Checking for the reply once more before giving up gave 0 timeouts,
with 127 late replies taken:

--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1493,2 +1493,6 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	status = wait_for_completion_timeout(&dp->complete, timeout);
+	if (!status) {
+		synchronize_irq(dp->irq);
+		status = try_wait_for_completion(&dp->complete);
+	}
 	if (!status) {

Feel free to fold it in.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Claude (Anthropic) wrote this change; I reviewed and tested it.

