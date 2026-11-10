Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6F60774FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w7fPwDOw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8iGUkKq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AbsOE3Hi6gKlewU2wMeuR/7vabb3aztdvLC1eqNs0fU=; b=w7fPwDOwW3EumR
	D7UKyVd9cFXzllAXyt7DtljqJSSzEir5yHhwHaovUB6bU/0t1z1GW7wj+R67fHHE7IQdfzS8wRHWG
	cvluQJoZuYttJjlqqG+oDCywofjcZtgHpTKhoTO5ZyYnTqG47nxVypQFohhbXRc/Mp20FKWn+NWrH
	KkrTj8olh655DD8P0r73PRCkMHs+sNm/VaJ6a1HiCjPN2VqTncAJ0vTB0IsVl6TRxYIojdXuEPa8U
	0pcSvRwFH10u822B0x92I9+gIpVEu8i39k5LxmAL3vZLf9rSEJw09eZIpXy+59WEETq1WH1ZMp/bT
	gJqiJ6BwX5bZC68iUKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiCQ-00000003HC6-2nzR;
	Tue, 10 Nov 2026 09:31:30 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiCL-00000003H9X-0ZIj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:31:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1037637a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303084; x=1794907884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbsOE3Hi6gKlewU2wMeuR/7vabb3aztdvLC1eqNs0fU=;
        b=g8iGUkKqYwtRtGAI/DQRzcgskPfsEBnvTKE1MPNPRNQdeKDGFRivuzfRs68b9EYE8Q
         JZY6xpXPHfkOSdl3F7d05iorl54gw0ZzZlypMMAFkzDAWC+tvB+AU4u8p2Zuc6ezWAm0
         BfMH5oj/To96VIk6sVtgdELVOeGlX5p9YxkY263MMl3syUpX30GmQW5tqZRnm2EbBpGQ
         /9LtLIEJstwDg2Vjb2lQrHvilZwNcLu9wUFgRBBhhUlaffRc8983VWOTz5noUxHNgnsw
         O6wBcz2ObNYKbOxUXxzLNhK0YJQ7ZG1itYeR8T4nOIFUtUJXZ+qo5aQmVes5FWHO0jbU
         YFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303084; x=1794907884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbsOE3Hi6gKlewU2wMeuR/7vabb3aztdvLC1eqNs0fU=;
        b=NlOmjqleummnQOw93K0NIF/iXg7vpABFWRvjxz1tgaRCDCGkytRIqJItkv5HU780oI
         z4PrQD2ZSrIAddrxdWDcn/nauUpIMG4OWkqMYXbGRRJaK9vuS/gn5TVqJT95sOdOd0KV
         IjEHZpjPtB1kCJQvCdpiiflLcYJBeQ9PkksE5ExoqAHVOuy9fho0UdqSw8uV0izdvGTu
         eR//lj6GM/icSUxts6EoUoi4DC6KxEAwZBwqlPoxPSZUJGFkzsSCpHDE/0SsBZYJgtXG
         /FX8DeGNr2TDjpsVVAbAivhjKCPmZRhSe6Bi41xUNRurVdh2EuRhNYDMR4/Mv+V160h4
         n0nw==
X-Forwarded-Encrypted: i=1; AL+hErEUICtmd73d1qh02PX+AuEFeJAY1fmeb9Mp0XZ7w3zoRFjGLNY1N8/DWRkSug+nF0hK7+cS6TrraVi+U5pVZ0BH@lists.infradead.org
X-Gm-Message-State: APuU4Z8VjMyDuEtj+fRMOXohNs3lrf5f6keSGhkwBcmu5nrln+RItW2f
	9Bglvhl0LF9xtFgUwAv2Qqf5NA6ITh33heeq8cvUbf0ScM+5qwUD3Cdg
X-Gm-Gg: AYBFou3otbCqlP0A04bNvfGaSP9JAZ2JM8HieGooyrsvWDPWMUmpFtuDibW2KLuT4Y6
	y1/5oIjUlQ//ny7bUY4kNXpbImKbgPAKAAnwZjxB0SO+wbZ++ajWFhqY44Wmsd/NVV034gjuu+j
	S2ohKVUkEk4ELJlpfKGLcwRybJZPgJOE0rF2EytPQZKHa2vuolnEk1Mk+LuQudVz186trRXHMTC
	8OmtY9kiQ4PwETWfaEXw3uFwASxpvJhvTU+N4mQ5hE9zuXByjwtR6ZyAAFnr2m2D6XAh6cEc6nK
	D+i5L5UYGZwpPKcvKBiNpeRUfz/QsNbw8i/MyrNOvG5+XNU3mSb4/rN3hsjib3PRWjD+zzs/Od8
	KKLxtCShkgzTNgKDPrRDjj79hOdJNZujaASFNnmvTwvEAYo82mM0PGQr9npeNApDuiBiLKXBklW
	KD887i+Ts1AV+C29OkFGaUqeHmlauT3mf9SCvHLWwuijUnRTkU2jRBk799hTxP871HFsys8s2hs
	BsL0doMKX2x8MrIF2kVxiV1hBI/cnBEQWIJB6HMpDkG2mqapNerFxTAO8f1btIfbWXpHwqKsSwR
	0fzeelJOG3pJQJDDVubaCiJL4etAX0Mp4TM3zJy83pLzhZEyAW7Wjpjt3x06Dsja
X-Received: by 2002:a17:90b:5244:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b166e3d9b7mr2046531a91.64.1794303084213;
        Tue, 10 Nov 2026 01:31:24 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16913b050sm1115979a91.4.2026.11.10.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:23 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	robh@kernel.org
Cc: gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	klightspeed@killerwolves.net,
	jason@lakedaemon.net,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: marvell: Remove duplicate DS212 compatible
Date: Tue, 10 Nov 2026 03:31:19 -0600
Message-ID: <20261110093120.179318-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110093120.179318-1-artem122novak@gmail.com>
References: <20261110093120.179318-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_013125_176286_9A662519 
X-CRM114-Status: GOOD (  10.18  )
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

The Kirkwood Device Tree binding lists "synology,ds212pv10"
twice in the compatible sequence for the Synology DS212.

Remove the duplicate so that the documented compatible
sequence contains only unique identifiers.

Fixes: 1c5f2ea8ce7f ("dt-bindings: arm: marvell: Convert marvell,kirkwood boards to DT schema")
Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
index 120784066833..bca7f98dffae 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
@@ -55,7 +55,6 @@ properties:
       - items:
           - const: synology,ds212
           - const: synology,ds212pv10
-          - const: synology,ds212pv10
           - const: synology,ds212pv20
           - const: synology,ds213airv10
           - const: synology,ds213v10
-- 
2.56.0


