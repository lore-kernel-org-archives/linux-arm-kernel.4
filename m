Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CE4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I8quxzGF;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EqYcPMpl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7ESMF4tavevVKRGfk/x6V4l0oVv6vrtry4vVctn7dUU=; b=I8quxzGFuoroI6YLcRwy3GNcVy
	HgFaACeqAaxY1KHNanAfVizGPPp7qg5qf7IUtJCQY91jpQMHcjmwzn5BQWs2MZBwhYeEgW5v8YNE5
	YYQ5UajhXtdSSZwvpgwyPf8RdBXvo1TU4wM06S/Tj+8Ie4qYkO7dOVsKhbjgE2EB/LB54HXm2CKAy
	GjU3XktySIsJwN+UiyaWfD1FMtDr20C1p7VPtC1YnWRIziSH9RserWoBpok4FGbAJKJ0NIlxaqM/I
	EVY+LF36PLSxvTiR4u7e00KvJoHBLO/IXpzD2SDsy8tAeVjBJ3R/tVr3Plt35gDvjGPFatWDyaUf7
	HNruzYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tY-00000006YIa-3d05;
	Wed, 11 Nov 2026 11:53:40 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tU-00000006YDs-0FNO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:38 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a211bff50bso20487815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398013; x=1795002813; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ESMF4tavevVKRGfk/x6V4l0oVv6vrtry4vVctn7dUU=;
        b=EqYcPMpltP+T9MEZlmkaxFa3v6YeYnq8yndFFVvr7f/qr5wl9l9CG//PjVsbP+JB88
         EKG5IY7/CO2YeeBTOaUy3ty/gvEHso3ChAyHdiM1BnAf6tArrBs/LDv/c+NWTt9oXz4q
         TeF0X6IHby1hg0iFwi+Y3Iql948VzOIY1Py5WLdlK2KLvUZfKJd1KtaJtp4Iyst9VEI+
         fBQBzBvQsV50B2IH0BlEXjXV0812fOuRk76doo/5MatOCD+Kg6fVNvQqsl8bzV6XCQEh
         /iZLr5z8/UwSXjTBjEMSkIGa2AdeIRCyukeZ6hAqfD917Vbtv5g5m8tTy83MFODMkhx9
         8GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398013; x=1795002813;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ESMF4tavevVKRGfk/x6V4l0oVv6vrtry4vVctn7dUU=;
        b=tB/SIhuaG2kKhGB496lsCn1N9j1KHhNeAFfy67kFbZyoQeta4izRIRjm6glzpt4HXg
         ivH8qf72HA4uO3/CGq3sS9WNekklPiv1l5nqcSWoi5BbuEoyLVo70zFeD4TZJaVj8ILo
         LpmYoDonASqgYtQArL4vuIbaSYrAYRgjAVu8CHcT2BiN3DrodeOhPNf/mMN12cXn9nrz
         PGhy1bV5YE5VGK/K+ucBhmJS3v5Lo4T3U9n9Lpehdiduue0MbxU236t6GmfUICueeM/I
         qpllH6A0WsAQ4K3VSkG4YJFwnCMozxYLwmRJAMimCJyEjkI02WarPxea/lcU1UCfxQi2
         2nlw==
X-Gm-Message-State: APuU4Z9XbdXsZdUrMbSAAA8OxVowgpN3OMAfExPknKt2kKXA1ESNdTZS
	85/V8pr7Gsl7li5odO922llVeVfyCXIjffebYjDJu0gA/VIYyKKSAdmjLCAv1kOGFl9nfiNj3fS
	bb/bd/7tE9blTZptbR2Vw7nhtesDZlM5DeC2qE9z87Yc5bH1wUwI5PhjS7wM8U9O76Txi1VMngM
	y9ERR85lKzRAYp3i2hr/C86nII6tRIeewxnBuT16pxrf7m
X-Received: from wroy8.prod.google.com ([2002:adf:f148:0:b0:499:de0a:f0c0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:82f1:b0:4a2:cbe:beac
 with SMTP id 5b1f17b1804b1-4ba093c85ebmr42901915e9.23.1794398013137; Wed, 11
 Nov 2026 03:53:33 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:09 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=ardb@kernel.org;
 h=from:subject; bh=rQf0Hc3083LXfxqXRhocE5se1KpHJ52vNrZ3THAhMXs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuNrlo8efh6UHTRCunye0v70su92BLfZakfd+Rd8f6
 YFFn3k6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETk5zL80z18uGz2w11nbyrX
 24jmMqz2fzz9zUHpmZ8eWpuWbOyafpvhf4j1tYLk9KbjDRtqGoz4VjdrKyxVy1xQKce22rTYhCm CCwA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-14-ardb+git@google.com>
Subject: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at resume
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035336_124255_F8E9D302 
X-CRM114-Status: GOOD (  14.76  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
to idle, the touchpad is often reset, presumably because it loses power,
and it may still be starting up when it is powered on again at resume.
If it doesn't acknowledge the power on command, i2c-hid tries once more
0.5 ms later, and then fails the resume:

  [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
  [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6

hid-multitouch then never puts the touchpad back into touchpad mode, so
it stays in the mouse mode it starts up in, without two-finger
scrolling, until the next suspend and resume.

This happened after about one in eight suspends. With a debug patch that
keeps trying, the touchpad answered the next attempt, about 6 ms later,
each time it had missed the first two.

So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
waits for at probe, and at every resume before powering the touchpad on,
as the touchpad isn't a wakeup source.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 3e4df4335be8..accd80005195 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -496,6 +496,8 @@ tsel: hid@15 {
 		hid-descr-addr = <0x1>;
 
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
+
+		post-power-on-delay-ms = <20>;
 	};
 
 	tsc2: hid@2c {
-- 
2.56.0.611.g1030f0b940-goog


