Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27FE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I2w0p77r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVv6VoXl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=; b=I2w0p77r+AgP15
	hbVsgWMjmUI1qGeAsZM9+4mhNzkpbXYNMQfQrO16XQLssIq1ars6Sp8gqv4cXewtFxz8pBzAK3hPY
	elXVNqgAaFHNdLU/1vKFUKkoEO1nAnACOC1eZAPOPJFXsVGpxKmGocbqJaMZjZUxeri3L/05FC3Te
	vamdBvSnY1eHzBVOBWEoEVAnC7fjmO4WSPnpQQu+IWavh9Rsjmykk7lzBSzMKX+eg36wJKKtbhVJW
	gqtrjMRINS1T0ptf3drsxjCu+Uhkm+LPn+rMZwjDM8mAVbk4riuxAEogZRMcskn31BeGjMe5ww6tG
	YEj9ylG+WCpKmu1JRC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNXk-00000000WPe-2SMB;
	Mon, 09 Nov 2026 11:28:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNXi-00000000WP0-0vhQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:28:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so379672a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223685; x=1794828485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
        b=LVv6VoXlEBXU0cYSTof7nnZiAV86I/2TSZ2Ti1ocJLb21mKyqi+M/P12Qd/DuP002y
         rp2BfZ04aXF82E7OoQqact2wuGdUclUhm2Zft7Hks5j3O5GRK7leBua2hyYkUJAjwAoo
         VbEaJl70Dtr5o71gmw2BdYyP2fF26OeWC/ptBaNxoiyGaySu65jW6rR9/KVGJGtfycG2
         4641St7jmb87zPcyCkG9NH25uzmJE+xwNBMiK+L+LMLW1cMCRVEWDs1AzsMkaoO/sBzM
         YI481+LqFl2T25Xu4h2BEm2pZFgxggL8wlaoVqZw/tMO4fKnxttwdsx1j1JT+sJIDUFC
         JEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223685; x=1794828485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
        b=B7AuC7m1/hkNhoXdTSY2oyf1C2sBlRheQcUxzZvlkvaxik+4jguJsmKVcEvhD7YzmJ
         vJg9vGdSmoQwDy/fKSX4+ZOH1G4QtfRY9SmW30EVPTGn1eTlyjjdg2vs6i7uaXOczwdi
         HujP/SHsdy8S7kYVzRGnKgCtijTxkGYUgRFKzeFtsoCguoXQir/M9/gcJgAaT4Ud0oky
         iM/eOq5L0C/C6FcJk+NKpCPfA6Dw9Vs//pIO71WGb+97UneUACDjzsgSQDOKcGdAnbUV
         TmdP2DuUeOnOH63dws9qPR8r3EWU5BlGDaiXoxso1Nr/DB4mDA0D9Z9AV5hRL22O6AkX
         n8bg==
X-Forwarded-Encrypted: i=1; AL+hErEmb/V6KJBfTdNJ0eN1Hb9f1b+IRs1exCDb0JhsqyBE7GsjRv1I/n/XlyPLfW4W2IW/CzlPs63HeV1tLQFQM2Uq@lists.infradead.org
X-Gm-Message-State: APuU4Z8GC/94PAF+9yJgLBBukku6+DKdQW7VGWehBMzO0l1RCVRn2tLe
	DE22fR0XetBDXOyvqyRddunSWRBmekRy1TY6tWO93mKFiWzestIAVX7E
X-Gm-Gg: AYBFou24MUlGPVyQ87oN63E8oG5JOakg1rSObOXoLrQatNjTMI+vH4KB/kEJJmOyMEG
	gwtJgse0nUCW90hN9Pi2RtqFwqLNeNP05YSjxGyM598YXqostU1pvFDnxmIRA9rM7GLu8fJ671H
	DyB+zELECTWoPZJrBfJNduDhVpfBdJY7Dl3yHgBIs49WFu4JCo1pja+LiotY3+dhV7ymjxqJfC0
	muklHu1wTnfb1xbX7SzVqB/c7Zl/28SV5K3/IXKDVhRYozBvM7RUI18OUqxaedIL+d7+qifbhGb
	ipKMtk/QA77r1fLNiWL3nb17GAkIpjAAwmMAuWYxrS+3ZnwsCo3e2vy1XIp1S3ArqR6yfapfqpc
	805WZa5lCjJHj5rPjFkjPal9qn60MshJM8lAq23XYfv9dCBcr53CQAKbnv4YnYH2BvW+SqlfMeI
	tz4N6ZG8NwUQxwQd31R+ZMUfa5RLGaII8wOLfJUcjKBS3TimJEFBQeqlDpc1YcX+XvgCjbawoc4
	Z9zuUUi+ByKanGr8CJTy3kFFGaAfdCu0WuBFTE6aUXxZFzXkkWiP9XSIX/HnECN+0u0jMvExCAR
	ZkHib2OPka/cP98KKmH3jO0xxcFb5XWmqw==
X-Received: by 2002:a17:90b:4d10:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3b12d570debmr3765652a91.63.1794223685119;
        Mon, 09 Nov 2026 03:28:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm10766340a91.2.2026.11.09.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:28:04 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: sdonthineni@nvidia.com,
	james.morse@arm.com,
	robh@kernel.org,
	ben.horgan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Mon,  9 Nov 2026 19:27:37 +0800
Message-Id: <20261109112737.1081437-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com> <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_032806_263642_93F248FF 
X-CRM114-Status: UNSURE (   5.82  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested-by: Ping Li <leeonion.muyu@gmail.com>

