Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFEC606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjNPY9QI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot15KVVn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=; b=bjNPY9QIPZWUs7
	nBESbfsbeVznmTw5V5Lebyr7Qu22xXQgQN32NwdI1xN8QbFW+AxaJuuXWt0AO3JfFWBYNaoHgnyCd
	XI8zpSfvtIoc6TjsxG41qZ2bBgKfGTg8jFoDqM1AnLKhl+nHJUXDaWz8CmfqtMmeSGB8rU7fqibHe
	WdoSD3et45tsLEm8Fk/7BqzxIHXPolaORbG9sQLJvn3fvIlrYIbEnKGbX1vohDeaPXGtVdgwfwFPn
	lg+ljesBzMazrd7GjiP/7kpqdfx6eMmnAV/myfkBa7CwiCkkPCNIL0m4MWvNVKMAa7mv3OrNR1JLa
	NfNaLs62Ule+29TMaKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3Y-0000000F9uY-3yR0;
	Sat, 07 Nov 2026 18:22:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3R-0000000F9o7-3G24
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:22:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso10371815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075736; x=1794680536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=Ot15KVVn/FZ4y2yEVhFCttxzDWka0gAdiXJuDUNGtjVMnY1c8oRxGm3/u8yQ7m+vF4
         3KiEtYOZSW/pzQR/g6V3mJIweUXijFlTRceW7s6ERH9ffjnG1Pp5E3fh6UGTIskvMl+X
         8cxhpXo71aoGEgnyDyrOOa4+k+gmd3mnakHjqhuufDsrdRYbNv92XP9bjxl9Gchux2vD
         gCZ3OScioIdUIiajC0EHcnwF7EOWiHZwA5h+yEK67Qh+qPE5zhQ9SVJSNPhtiU3LG7cK
         SgBxLu03Ynn9JrDmwXyL3lXyaXppAo8ByHc+i/sXUJdX1z402r2/VlLigG4E3LK7VAku
         9cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075736; x=1794680536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=qV3Zt8c/3hhJuVQ0vZHkQ6qowVtxrOR9qnsNgn2iMT0RAjKMNxL70P8llWOiswJlZn
         GC84JI/dWq1DMz6ivhGPQi6kBuReKGFi9sFKQBgKgQU139V0uCrFzzlMPzmiJX20eAfL
         /zYyAvwaIv3AvfrrAvT9W0pZeVIGqUbJHsMFl/o0t+c6+xFOhQagpVzBrLq9tkjwmd7q
         ShCElwgI/4Muttydzn8KTXGo8N02KqFMhjj7k1r8FmG/D4V0/w2tGl23e1SDIWA8W7Bs
         Jokr1dNfIleY//kWXhCjMvLFRvI5UsNC9YXwhOFiFCwpap/5ICgwm3Uo9aDzjY74+aDW
         mUIA==
X-Forwarded-Encrypted: i=1; AKwUvBwsaQqIizwZ6H+p2ySEYvQJMf97fFo4/Z/lXjxYXmSPULfgm1ATBRvb4+gBn/gtAaUEWCDa4eOAQ/O9OkUotIMQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9cv0a4Gjc02oJWxDl/p5y6A7nLwpnIOBw+Ao+WfUaH02l1//z6
	h9FP66A33GEbrRlx1n9mQIHbGdSp1KN9j5oEMBVd5oWai/YglpDNKzvA
X-Gm-Gg: AYBFou2EBcOnylUiCxYrVnmr7VsSS+y+fV+uEOrZ1oCl3wuxJ4iRt+4ged433oB1yJf
	NATYhVDYMhzBmpzfkn/yNwdxs12Jy5+0KGsNghJFGokDU5B8HwAAdrDJl/OGBf+ZYf4aYXGMveG
	Rsb0v18oe9wcwrYeQs28lTrHAEnMUQ4H3IlpdJ4loaSNVo3EVtKsCfmDH04i7P2Ja4kc97gSvrY
	VrWkUVksc4ksEgKVp6QdS7cV1ghHiSiVuuA0pmiT2yW4zcTdDwem/dBE/Eg6NFJylJFgGYe3jq1
	66qScIc2vLPlm3VOYFdRX1vMg4qPqNDh/0N6vk5VaUytGEvStcIecjSqYpjsnleK1s8WTYuKy8P
	JV6zMIqILgpW2YMkVwZO1wxpHyIFry4Rmez/DCnE+SYY15iphNeJR+HqXAIP95nKbYDaGJ7b+Id
	b4eokjokzjmZor8XWl+KKbmF9oBP9Rfi0sFxfuGdJ59HXI+Nif5z/2KCJ7Fut3eAaO2Gc0GpN4s
	YmhVTkwauR5iHaSs9Ull0dwWF/VAl5Ja1Cq5p9wnB7LudQmqAmUF+do/ddrcvTSg0KWvGZURTVn
	0e7JKsYnL+FuJ/IgLLHYH6UNKbuXqabjvkuptsZ82nR+ZAn5/FUcVVdv3bJE1VedktZT3Wk9OWZ
	HkDwb3D1RGYurO+U=
X-Received: by 2002:a05:600c:8114:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4b6e0267f25mr100876325e9.31.1794075735680;
        Sat, 07 Nov 2026 10:22:15 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:15 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:32 +0100
Subject: [PATCH v2 2/6] firmware: raspberrypi: Fix indentation of return
 statement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-2-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=acy165BVhCPBqoiZ1D61v2aa3PiKHUPL5mFy64dozN8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xViPZpGbe3EcIdc8tO/kU7I9kDujb5JGo4q
 4DxcIgq6T+JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z08/EACVstIEZrV+LU+vktgC+n+/GER7F54JLwMgOgCSe6UwrjrZ2SdzmBbf9ObaE5CM8Ny7iFh
 3DtfCdDifAmMjF0zn1Xmb4p1EZZFJxJn61iTXKPaeUnZLSXxXCe14uBeTuMfdVfiRPsKPePcF3R
 jx1RE2YS8uYf8nn7SLmtn4OvxKLYcPuQSmFAENIPeE08zeiexWaDWEJU/J3FX2yhZymKjV7vNeF
 LqzKI1KT0DMvn676uOa/vLPc/cXsRHSjM4g8LwUC2YLDzTKrqC10/BQKRg6Yh5PPyBWlowW8cbO
 irHrtVFwb+ulcXxhpIhBRfku40eB2zuraBwC5Ole14oD1XQiRbVu3GNcDB83ulD4Fczo6mziQni
 +bmZVMqmvh4hxBz7Wmd+rwiIc1wv7WI+jMEtq6cwYwM4zEI9/XjS0zmH6NjuLFneyKOJboy6nAR
 30biqBkcCDcwRSdwz3rblDzw6owbpdYZxUboYoO9GHIyj5dVuQjFzAjzHiFkdkFGaxcDt0L4WRN
 CtiwYkABuWnHmKxGSJjA3SIIpUUgueywb2TnWFZv6aWDr7C0R6O+6shdzz/clmwNJgTlp3ZGnbh
 JrL4b4gZt7U63FlSWfUbk+9JlweUr2f919kNYuHiLeDyx/Woba3FEd5pHKG+5QhYfjyTZmojMFD
 muh+3CGApnjEwRQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_102217_833851_BC906906 
X-CRM114-Status: GOOD (  11.77  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The return was over-indented; statements should start on a tab stop.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 8f3653c4a669..e0c91719b4d0 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -267,7 +267,7 @@ unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int
 		 * assume the maximum clock rate is absolute maximum we can
 		 * store over our type.
 		 */
-		 return UINT_MAX;
+		return UINT_MAX;
 
 	return le32_to_cpu(msg.rate);
 }

-- 
2.56.0


